# tedge-rpm-plugin

## Plugin summary

Manage rpm Linux packages on a device using thin-edge.io software management plugin api.

**Technical summary**

The following details the technical aspects of the plugin to get an idea what systems it supports.

|||
|--|--|
|**Languages**|`shell` (posix compatible)|
|**CPU Architectures**|`all/noarch`. Not CPU specific|
|**Supported init systems**|`N/A`|
|**Required Dependencies**|-|
|**Optional Dependencies (feature specific)**|-|

### How to do I get it?

The following linux package formats are provided on the releases page and also in the [tedge-community](https://cloudsmith.io/~thinedge/repos/community/packages/) repository:

|Operating System|Repository link|
|--|--|
|redhat Linux (rpm)|[![Latest version of 'tedge-rpm-plugin' @ Cloudsmith](https://api-prd.cloudsmith.io/v1/badges/version/thinedge/community/rpm/tedge-rpm-plugin/latest/a=noarch;d=rpm%252Fany-version/?render=true&show_latest=true)](https://cloudsmith.io/~thinedge/repos/community/packages/detail/rpm/tedge-rpm-plugin/latest/a=noarch;d=rpm%252Fany-version/)|

### What will be deployed to the device?

* The following software management plugins which is called when installing and removing `rpm` packages via Cumulocity IoT
    * `dnf` - Manage (list/install/remove) packages via the RHEL Linux Package Manager


## Plugin Dependencies

The following packages are required to use the plugin:

* RHEL Linux

## Development

### Start demo

1. Start the demo

    ```sh
    just up
    ```

2. Bootstrap the device

    ```sh
    just bootstrap
    ```

### Stop demo

```sh
just down
```