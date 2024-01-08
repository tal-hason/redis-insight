# HELM Chart to deploy REDIS Insight into Openshift

## Used this chart to deploy an instance of REDIS insight ontop Red Hat Openshift and expose via Route

### How to install

1. Login via the oc cli tool to you cluster

    ```Bash
    oc login -u {{User}} {{Cluster-Api-url}}
    ```

2. check the latest Package version under this Git Repo Packages.

![Package](https://github.com/tal-hason/redis-insight/blob/main/.artifacts/Screenshot%20from%202024-01-08%2022-19-13.png)

install using the HElM CLI

```Bash
helm upgrade -i redis-insight oci://ghcr.io/tal-hason/helm/redis-insight/redis-insight
```

To install a spesific Verion use the Following:

```Bash
helm upgrade -i redis-insight oci://ghcr.io/tal-hason/helm/redis-insight/redis-insight --version 0.0.1
```

To remove/uninstall the Chart use:

```Bash
helm uninstall redis-insight
```

### Values

The except the following Values:
