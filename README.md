# Setup Piet action

![Release](https://img.shields.io/github/v/release/fabasoad/setup-piet-action?include_prereleases)
![Functional Tests](https://github.com/fabasoad/setup-piet-action/workflows/Functional%20Tests/badge.svg)
[![pre-commit.ci status](https://results.pre-commit.ci/badge/github/fabasoad/setup-piet-action/main.svg)](https://results.pre-commit.ci/latest/github/fabasoad/setup-piet-action/main)

This action installs one of the Piet Programming Language interpreters
called [npiet](http://www.bertnase.de/npiet).

## Prerequisites

The following tools have to be installed for successful work of this GitHub action:
[PowerShell](https://learn.microsoft.com/en-us/powershell).

> `Windows` is the only supported OS at this moment

## Inputs

| Name    | Required | Description                                                                   | Default | Possible values |
|---------|----------|-------------------------------------------------------------------------------|---------|-----------------|
| version | No       | npiet version that can be found [here](http://www.bertnase.de/npiet/old.html) | `1.3`   | `1.1`, `1.3`    |

## Example usage

### Input

npiet should print "Hi" if to use this image as input:

![hi](./hi.png)

### Workflow configuration

```yaml
name: Test

on: push

jobs:
  run-script:
    name: Piet
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@main
      - uses: fabasoad/setup-piet-action@main
      - name: Run script
        run: npiet hi.png
        shell: sh
```

### Result

```text
Run npiet hi.png
Hi
```
