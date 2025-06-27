# Setup Piet action

[![Stand With Ukraine](https://raw.githubusercontent.com/vshymanskyy/StandWithUkraine/main/badges/StandWithUkraine.svg)](https://stand-with-ukraine.pp.ua)
![Release](https://img.shields.io/github/v/release/fabasoad/setup-piet-action?include_prereleases)
![functional-tests](https://github.com/fabasoad/setup-piet-action/actions/workflows/functional-tests.yml/badge.svg)
![security](https://github.com/fabasoad/setup-piet-action/actions/workflows/security.yml/badge.svg)
![linting](https://github.com/fabasoad/setup-piet-action/actions/workflows/linting.yml/badge.svg)

This action installs one of the Piet Programming Language interpreters
called [npiet](http://www.bertnase.de/npiet).

## Supported OS

<!-- prettier-ignore-start -->
| OS      |                    |
|---------|--------------------|
| Windows | :white_check_mark: |
| Linux   | :x:                |
| macOS   | :x:                |
<!-- prettier-ignore-end -->

## Prerequisites

The following tools have to be installed for successful work of this GitHub action:
[PowerShell](https://learn.microsoft.com/en-us/powershell).

## Inputs

```yaml
- uses: fabasoad/setup-piet-action@v0
  with:
    # (Optional) npiet interpreter version. Defaults to "1.3" version.
    version: "1.3"
    # (Optional) If "false" skips installation if npiet is already installed.
    # If "true" installs npiet in any case. Defaults to "false".
    force: "false"
```

## Outputs

<!-- prettier-ignore-start -->
| Name      | Description                       | Example |
|-----------|-----------------------------------|---------|
| installed | Whether piet was installed or not | `true`  |
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
      - uses: actions/checkout@v4
      - uses: fabasoad/setup-piet-action@v0
      - name: Run script
        run: npiet hi.png
        shell: sh
```

### Result

```text
Run npiet hi.png
Hi
```

## Contributions

![Alt](https://repobeats.axiom.co/api/embed/19fc207a8b468fcb30d29651dbe1490364101f55.svg "Repobeats analytics image")
