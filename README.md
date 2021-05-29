# innersource-crawler-ruby

This project creates a `repos.json` that can be utilized by the [SAP InnerSource Portal][SAP-InnerSource-Portal]. The current approach assumes that the repos that you want to show in the portal are available in a GitHub organization, and that they all are tagged with a certain _topic_.

## Installation

`bundle install`

## Usage

### Configuration

You only have to do the below configuration once.

1. Copy `.env-example` to `.env`
1. Fill out the `.env` file with a _token_ from a user that has access to the organization to scan (listed below)
1. Fill out the `.env` file with the exact _topic_ name you are searching for
1. Fill out the `.env` file with the exact _organization_ that you want to search in

### Crawling

Running the crawler will create a `repos.json` file containing the relevant metadata for the GitHub repos for the given _topic_.

```
ruby crawler.rb
```

After that, copy `repos.json` to your instance of the [SAP-InnerSource-Portal][SAP-InnerSource-Portal] and launch the portal as outlined in their installation instructions

## References

* This crawler is meant to be used in combination with the [SAP InnerSource Portal][SAP-InnerSource-Portal] to list all InnerSource projects of a company.
* That portal is a reference implementation of the [InnerSource Portal pattern](https://patterns.innersourcecommons.org/p/innersource-portal). To understand the motivation behind using such a portal in your company, we recommend to read that pattern.
* [zkoppert/innersource-crawler](https://github.com/zkoppert/innersource-crawler) is another crawler implementation similar to this one, but using Python instead.

## Contributing

You want to contribute something to this project? That's awesome! :)

Before sending a Pull Request with a change, we recommend that you open an [Issue](https://github.com/spier/innersource-crawler-ruby/issues) first, to discuss the proposed change with the rest of the community.

## License

[MIT License](LICENSE)

[SAP-InnerSource-Portal]: https://github.com/sap/project-portal-for-InnerSource
