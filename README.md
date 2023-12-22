# tedge-rpm-plugin

:construction: This repository is still under active development, so don't expect anything to work just yet.

## Plugin summary

Manage rpm packages on a device using thin-edge.io software management plugin api.

**Technical summary**

The following details the technical aspects of the plugin to get an idea what systems it supports.

|||
|--|--|
|**Languages**|`shell` (posix compatible)|
|**CPU Architectures**|`all/noarch`. Not CPU specific|
|**Supported init systems**|`N/A`|
|**Required Dependencies**|`dnf` or `microdnf` or `zypper`|
|**Optional Dependencies (feature specific)**|-|

### How to do I get it?

The following linux package formats are provided on the releases page and also in the [tedge-community](https://cloudsmith.io/~thinedge/repos/community/packages/) repository:

|Operating System|Repository link|
|--|--|
|RHEL/CentOS/Fedora|[![Latest version of 'tedge-rpm-plugin' @ Cloudsmith](https://api-prd.cloudsmith.io/v1/badges/version/thinedge/community/rpm/tedge-rpm-plugin/latest/a=noarch;d=rpm%252Fany-version/?render=true&show_latest=true)](https://cloudsmith.io/~thinedge/repos/community/packages/detail/rpm/tedge-rpm-plugin/latest/a=noarch;d=rpm%252Fany-version/)|

### What will be deployed to the device?

* The following software management plugins which is called when installing and removing `rpm` packages via Cumulocity IoT
    * `rpm` - Manage (list/install/remove) packages via an RPM base Package Manager (e.g. dnf/microdnf/zypper)


## Plugin Dependencies

The following packages are required to use the plugin:

* dnf or microdnf or zypper

## Development

The following tools are requires for local development. Please install them before following the instructions:

* [nfpm](https://nfpm.goreleaser.com/tips/) - Tool to build linux packages
* [go-c8y-cli](https://goc8ycli.netlify.app/) - A Cumulocity IoT CLI app
* [c8y-tedge extension](https://github.com/thin-edge/c8y-tedge) - go-c8y-cli extension for thin-edge.io to help with bootstrapping

### Start demo

1. Build the tedge-rpm-plugin package

    ```sh
    just build
    ```

2. Start the demo

    ```sh
    just up
    ```

3. Activate your Cumulocity IoT session in go-c8y-cli where you want to bootstrap the device to

    ```sh
    set-session
    ```

    `set-session` is part of [go-c8y-cli](https://goc8ycli.netlify.app/), check out the documentation for instructions on how to install and create your session if you don't already have one.

4. Bootstrap the device

    ```sh
    just bootstrap
    ```

    The bootstrap command used the [c8y-tedge extension](https://github.com/thin-edge/c8y-tedge).

### Stop demo

```sh
just down
```
