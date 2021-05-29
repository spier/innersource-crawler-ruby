require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)
Dotenv.load

# A dummy implementation of how to calculate an activity score for a repository.
# The activity score can be used for sorting the repos in the portal.
# For inspiration of how to calculate such a score see https://innersourcecommons.gitbook.io/innersource-patterns/patterns/repository-activity-score
def calculateScore(repo)
  (1 + repo.stargazers_count) * (1 + repo.watchers_count) - repo.open_issues
end

# tests whether the file with `filename` exists in the GitHub `repo`
def fileExists?(client, repo, filename)
  fileExists = true
  begin
    client.contents(repo.full_name, :path => filename)
  rescue Octokit::NotFound => ex
    fileExists = false
  end
  return fileExists
end

# -------------------
# Main block
# -------------------

# Auth to GitHub.com
client = Octokit::Client.new(:access_token => ENV['GH_TOKEN'])
client.auto_paginate = true
client.default_media_type = "application/vnd.github.v3+json"

# Get repos for the configured ORGANIZATION and TOPIC
# Note: The GitHub Search API limits search results to max 1.000 repos.
search_string = "org:#{ENV['ORGANIZATION']} topic:#{ENV['TOPIC']}"
repos = client.search_repos(search_string)

repos_output = []

repos[:items].each do |repo|
  puts repo.full_name

  participation_stats = client.participation_stats(repo.full_name)

  repo["_InnerSourceMetadata"] = {}
  repo["_InnerSourceMetadata"]["participation"] = participation_stats["all"]
  repo["_InnerSourceMetadata"]["score"] = calculateScore(repo)

  if (fileExists?(client, repo, "CONTRIBUTING.md"))
    repo["_InnerSourceMetadata"]["guidelines"] = "CONTRIBUTING.md"
  else
    repo["_InnerSourceMetadata"]["guidelines"] = nil
  end

  # Note: We are serializing the full repository metadata here, even though the SAP InnerSource Portal only needs a subset of those attributes. One could save some storage space here and increase readibility of the `repos.json` file.
  repos_output << repo.to_hash
end

File.write('repos.json', JSON.pretty_generate(repos_output))
