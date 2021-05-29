# innersource-crawler-ruby

This project creates a `repos.json` file that can be utilized by the [SAP InnerSource Portal][SAP-InnerSource-Portal]. See [sample JSON structure](https://github.com/SAP/project-portal-for-innersource/blob/main/repos.json).

The crawler assumes that the repositories that you want to show in the portal are available in a GitHub organization, and that they all are tagged with a certain _topic_ e.g. `inner-source`.

## Installation

`bundle install`

## Usage

### Configuration (one time only)

1. Copy `.env-example` to `.env`
1. In `.env` fill in `ORGANIZATION` with the exact name of the GitHub organization to search in
1. In `.env` fill in `GH_TOKEN` with the [access token](https://docs.github.com/en/github/authenticating-to-github/keeping-your-account-and-data-secure/creating-a-personal-access-token) from a user that has access to the organization to search in
1. In `.env` fill in `TOPIC` with the name of the topic to search for


### Crawling

Running the crawler will create a `repos.json` file containing the relevant metadata for the GitHub repos containing the given `TOPIC` in the given `ORGANIZATION`.

```
ruby crawler.rb
```

After that, copy `repos.json` to your instance of the [SAP-InnerSource-Portal][SAP-InnerSource-Portal] and launch the portal as outlined in their installation instructions.

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
