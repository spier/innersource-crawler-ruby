# innersource-crawler-ruby

This project creates a `repos.json` that can be utilized by the [SAP InnerSource Portal][SAP-InnerSource-Portal]. The current approach assumes that the repos that you want to show in the portal are available in a GitHub organization, and that they all are tagged with a certain _topic_.

## Installation

`bundle install`

## Usage

1. Copy `.env-example` to `.env`
1. Fill out the `.env` file with a _token_ from a user that has access to the organization to scan (listed below)
1. Fill out the `.env` file with the exact _topic_ name you are searching for
1. Fill out the `.env` file with the exact _organization_ that you want to search in
1. Run `ruby ./crawler.rb`, which will create a `repos.json` file containing the relevant metadata for the GitHub repos for the given _topic_
1. Copy `repos.json` to your instance of the [SAP-InnerSource-Portal][SAP-InnerSource-Portal] and launch the portal as outlined in their installation instructions

[SAP-InnerSource-Portal]: https://github.com/sap/project-portal-for-InnerSource
