---
title: Docker / Podman overview
permalink: docker-podman-overview.html
sidebar: default_sidebar
tags: [docs]
keywords: docker, podman
last_updated: March 30, 2023
toc: false
folder: docs
---

Brief overview on how the use of docker/ podman within the MB environment

* Installation
* Networking
* Harbor proxy cache
* Prerequisite packages
* Optional packages


## Installation

The docker-ce runtime and the podman runtime are provided over our ubunturepo.rd.corpintra.net as separate 3rd-party repositories
Both are mirrored directly from upstream and available on all systems by default

## Prerequisite packages

 * docker-ce
 * docker-compose

## Optional packages

* docker-ce-cli
* docker-ce-rootless-extras
* docker-compose-plugin

## Networking

We are whitelisting the following network on all UbuntuRD systems, please make sure your containers are within the given range:

```bash
172.17.0.0/16
```

Contact <ubuntu-support@mercedes-benz.com> if you need an exception.

## Harbour proxy cache
Due to network access / traffic limitations, MB provides a pull-through proxy cache for the most common container registries:

* docker.io / dockerhub
* quay.io
* k8s
* ...

Taking docker.io/dockerhub as an example:

To pull official images you have to use /library/ in your docker pull command:

```bash
docker pull <endpoint>/dockerhub/library/<image>:<tag>
```

To pull un-official images use the below syntax:

```bash
docker pull <endpoint>/dockerhub/<reponame>/<image>:<tag>
```

## Proxy Settings

There are some gotchas and painful limitations when using docker within the corporate NW.

__i)__ As direct access to public docker registries is not allowed, you will need to use the pull-through proxies mentioned below.

__ii)__ Direct internet access is not allowed, you may need to configure your docker environment to use our corporate proxies or your localy-run proxy middleware __(px-proxy)__ manually.

This can be done either globally in one of the ways documented here <https://docs.docker.com/network/proxy/>

Or, as mentioned in the doc, by passing the __HTTP__ proxy variables to docker as a command-line argument.

```bash
$ docker run --env HTTP_PROXY="http://127.0.0.1:3128" --env HTTPS_PROXY="http://127.0.0.1:3128" -d --network=host -v /opt/open-webui:/app/backend/data -e OLLAMA_API_BASE_URL="http://127.0.0.1:11434/api" --restart=unless-stopped --name open-webui registry-emea.app.corpintra.net/ghcrcache/open-webui/open-webui:main
```
Note, if your docker container does not use host nw mode, you will need to point it to your px-proxy instance on your host by changing the ```127.0.0.1``` to the docker iface ```172.17.0.1```

px-proxy is configured to allow connections from the default docker nw ``` 172.17.0.0/16```

__iii)__ Sometimes you may need to pass either static DNS entries or DNS adresses to your build, surprisingly this is more common on zscaler vpn.

This is very well documented here   __<https://docs.docker.com/network/proxy/>__

Example for adding a static entry for the repo server on a zscaler VPN connection.

```bash
$ docker build --add-host=ubunturepo.rd.corpintra.net:100.64.1.15 (zscaler-resolved ubunturepo IP)
```

Please consult the documentation below for detailed instructions and a recent list of supported repositories:
<https://git.i.mercedes-benz.com/DHC/DHC-Container-Registry/blob/main/technical-information/4-working-with-images/proxy-cache.md>

Internal registries:
<https://git.i.mercedes-benz.com/DHC/DHC-Container-Registry/blob/main/README.md#registry-endpoints>

## Registry endpoints
Our DHC Container Registry (Harbor) is available in the following regions:

| Region    | URL                                                                                       | Version
| ---       | ---                                                                                       | ---
| EMEA      | [https://registry.app.corpintra.net](https://registry.app.corpintra.net)                  | v2.8.2
| EMEA AWS  | [https://registry-emea.app.corpintra.net](https://registry-emea.app.corpintra.net)        | v2.8.2
| NAFTA     | [https://registry-americas.app.corpintra.net](https://registry-americas.app.corpintra.net)| v2.8.2
| CHINA     | [https://reg-dhc-china.app.corpintra.net](https://reg-dhc-china.app.corpintra.net)        | v2.8.2

