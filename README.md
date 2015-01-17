# Toolset

[![Build Status](https://travis-ci.org/bound1ess/toolset.svg?branch=master)](https://travis-ci.org/bound1ess/toolset)

Very experimental project.

## Tests

- `100%` code coverage.

```shell
rake test
cat coverage/coverage.json
```

## Gem

```shell
rake build-gem
rake install-gem
```

## Supported languages and package managers

Here they are:

### PHP

- [Composer](https://getcomposer.org) is supported.

### JavaScript

- [NPM](https://www.npmjs.com) support.
- [Bower](http://bower.io) is supported, too.

### Ruby

- [RubyGems](https://rubygems.org) support.

## CLI

```shell
toolset scan-project path/to/your/project
toolset scan-projects path/to/projects/directory
```

## Output

The following output formats are supported:

- `json`
- `plain`
