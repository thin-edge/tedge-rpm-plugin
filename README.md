# tedge-rpm-plugin

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
|RHEL/CentOS/Fedora/openSUSE|[![Latest version of 'tedge-rpm-plugin' @ Cloudsmith](https://api-prd.cloudsmith.io/v1/badges/version/thinedge/community/rpm/tedge-rpm-plugin/latest/a=noarch;d=any-distro%252Fany-version;t=binary/?render=true&show_latest=true)](https://cloudsmith.io/~thinedge/repos/community/packages/detail/rpm/tedge-rpm-plugin/latest/a=noarch;d=any-distro%252Fany-version;t=binary/)|


### What will be deployed to the device?

* The following software management plugins which is called when installing and removing `rpm` packages via Cumulocity IoT
    * `rpm` - Manage (list/install/remove) packages via an RPM base Package Manager (e.g. dnf/microdnf/zypper)


## Plugin Dependencies

The following packages are required to use the plugin:

* dnf or microdnf or zypper

## Development

The following tools are requires for local development. Please install them before following the instructions:

* [nfpm](https://nfpm.goreleaser.com/tips/) - Tool to build linux packages

### Testing

1. Create a dotenv (`.env`) file containing the Cumulocity credentials to be used for the system tests

    **file: .env**

    ```sh
    C8Y_BASEURL=https://example.cumulocity.com
    C8Y_USER=
    C8Y_PASSWORD=

    # one of; IMAGE=rockylinux|opensuse|fedora
    IMAGE=fedora
    ```

2. Install the test dependencies

    ```sh
    just venv
    just build
    ```

3. Run tests

    ```sh
    just test
    ```
