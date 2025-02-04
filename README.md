# uCore 🛠️

[![Build Image](https://github.com/coxde/ucore/actions/workflows/build.yml/badge.svg)](https://github.com/coxde/ucore/actions/workflows/build.yml)

## Purpose 🤔

This repository is for my personal OS image, very much based on my own needs. It's based on [uCore](https://github.com/ublue-os/ucore/) and a template published by the [Universal Blue](https://universal-blue.org/) Project.

## Features ✨

-   Fish and other useful tools
-   Some tweaks compared to the upstream

## Installation ⚙️

### Rebase

Please read the [documentations](https://github.com/ublue-os/ucore?tab=readme-ov-file#installation) from the upstream

## Verification ✅

These images are signed with [Sigstore](https://www.sigstore.dev/)'s [cosign](https://github.com/sigstore/cosign). You can verify the signature by downloading the `cosign.pub` file from this repo and running the following command:

```bash
cosign verify --key cosign.pub ghcr.io/coxde/ucore
```

## Credits 💌

-   [Universal Blue](https://universal-blue.org/)
-   [BlueBuild](https://blue-build.org/)
-   [uCore](https://ucore.gg/)
