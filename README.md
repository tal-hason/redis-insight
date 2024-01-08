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

| Key                   | Value                                     | Description                                                                                                      |
|-----------------------|-------------------------------------------|------------------------------------------------------------------------------------------------------------------|
| global.container.image| 'docker.io/redislabs/redisinsight'        | Redis Insight Official Docker image                                                                              |
| global.container.tag  | 'latest'                                  | Tag of the Redis Insight Docker image                                                                            |
| global.service.name   | 'redis-insight'                           | Name of the OpenShift service for Redis Insight                                                                  |
| global.service.port   | 8001                                      | Port for the OpenShift service                                                                                  |
| global.route.tls.enabled | false                                   | Whether TLS is enabled for the OpenShift route                                                                   |
| global.route.appsDomain | apps-crc.testing                         | Domain for OpenShift route                                                                                       |
| global.storage.pvc.enabled | true                                 | Enable or disable Persistent Volume Claim (PVC) for Redis Insight storage                                       |
| global.resources.requests.cpu | 500m                                | CPU request for deployment                                                                                      |
| global.resources.requests.memory | 512Mi                             | Memory request for deployment                                                                                   |
| global.resources.limits | {}                                       | Limits for deployment resources (CPU, memory, etc.)                                                             |
| global.configs.logLevel | "WARNING"                                | Log level configuration for the application. Possible values: "DEBUG", "INFO", "WARNING", "ERROR", "CRITICAL"   |
| global.configs.homeDir | "/db"                                      | Storage directory for RedisInsight, where application data is stored (local database, log files, snapshot files)|
