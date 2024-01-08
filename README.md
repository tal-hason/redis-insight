# HELM Chart to deploy REDIS Insight into Openshift

## Used this chart to deploy an instance of REDIS insight ontop Red Hat Openshift and expose via Route

### How to install

1. Login via the oc cli tool to you cluster

    ```Bash
    oc login -u {{User}} {{Cluster-Api-url}}
    ```

2. check the latest Package version under this Git Repo Packages.

![Package](https://github.com/tal-hason/redis-insight/blob/73ca415e3d66ece3fadfeb6033bc26e675061c1c/.artifacts/package.png)

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

```YAML
global:
  ## Redis Ingsight Officail image
  container:
    image: 'docker.io/redislabs/redisinsight'
    tag: 'latest'
  ## Openshift Service propertis 
  service:
    name: redis-insight
    port: 8001
  ## Openshift Route Properties  
  route:
    tls:
      enabled: true
    appsDomain: apps-crc.testing
  ## Redis Insghit Storage Configuration  
  storage:
    pvc:
      enabled: true
  ## Deployment Resources    
  resources:
    requests:
      cpu: 500m
      memory: 512Mi
    limits: {}
      # cpu: 500m
      # memory: 512Mi
  configs:
    ## Description: Configures the log level of the application. 
    ## Possible values are - "DEBUG", "INFO", "WARNING", "ERROR" and "CRITICAL".
    logLevel: "INFO"
    ## Description: Sets the storage directory where RedisInsight stores application data 
    ## (such as local database, log files and snapshot files).
    homeDir: "/db"
```

The Chart Have the following Values:

| Key                   | Value                                     | Description                                                                                                      |
|-----------------------|-------------------------------------------|------------------------------------------------------------------------------------------------------------------|
| global.container.image| 'docker.io/redislabs/redisinsight'        | Redis Insight Official Docker image                                                                              |
| global.container.tag  | 'latest'                                  | Tag of the Redis Insight Docker image                                                                            |
| global.service.port   | 8001                                      | Port for the OpenShift service                                                                                  |
| global.route.tls.enabled | false                                   | Whether TLS is enabled for the OpenShift route                                                                   |
| global.route.appsDomain | apps-crc.testing                         | Domain for OpenShift route                                                                                       |
| global.storage.pvc.enabled | true                                 | Enable or disable Persistent Volume Claim (PVC) for Redis Insight storage                                       |
| global.resources.requests.cpu | 500m                                | CPU request for deployment                                                                                      |
| global.resources.requests.memory | 512Mi                             | Memory request for deployment                                                                                   |
| global.resources.limits | {}                                       | Limits for deployment resources (CPU, memory, etc.)                                                             |
| global.configs.logLevel | "WARNING"                                | Log level configuration for the application. Possible values: "DEBUG", "INFO", "WARNING", "ERROR", "CRITICAL"   |
| global.configs.homeDir | "/db"                                      | Storage directory for RedisInsight, where application data is stored (local database, log files, snapshot files)|

### Post installation

- After the pod has finish loading access the Route.

![Pod Logs](https://github.com/tal-hason/redis-insight/blob/73ca415e3d66ece3fadfeb6033bc26e675061c1c/.artifacts/pod-logs.png)

- the following screen should appeare:

![First Login](https://github.com/tal-hason/redis-insight/blob/36faf993de8122a877a6af276408a0398ae9a616/.artifacts/First-login.png)

- Please approve all the Check boxes to proceed.

![Check-Box](https://github.com/tal-hason/redis-insight/blob/362ea161709b82ba565deb549e2e4421602a7af5/.artifacts/First-login.png)

- Now you can start using

![Start](https://github.com/tal-hason/redis-insight/blob/362ea161709b82ba565deb549e2e4421602a7af5/.artifacts/landing-page.png)
