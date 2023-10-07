# Setup Piet action

[![Stand With Ukraine](https://raw.githubusercontent.com/vshymanskyy/StandWithUkraine/main/badges/StandWithUkraine.svg)](https://stand-with-ukraine.pp.ua)
![Release](https://img.shields.io/github/v/release/fabasoad/setup-piet-action?include_prereleases)
![functional-tests](https://github.com/fabasoad/setup-piet-action/actions/workflows/functional-tests.yml/badge.svg)
![pre-commit](https://github.com/fabasoad/setup-piet-action/actions/workflows/pre-commit.yml/badge.svg)

This action installs one of the Piet Programming Language interpreters
called [npiet](http://www.bertnase.de/npiet).

## Prerequisites

The following tools have to be installed for successful work of this GitHub action:
[PowerShell](https://learn.microsoft.com/en-us/powershell).

> `Windows` is the only supported OS at this moment

## Inputs

<!-- prettier-ignore-start -->
| Name    | Required | Description                                                                   | Default | Possible values |
|---------|----------|-------------------------------------------------------------------------------|---------|-----------------|
| version | No       | npiet version that can be found [here](http://www.bertnase.de/npiet/old.html) | `1.3`   | `1.1`, `1.3`    |
<!-- prettier-ignore-end -->

## Example usage

### Input

`npiet` should print "Hi" if to use this image as input:

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
