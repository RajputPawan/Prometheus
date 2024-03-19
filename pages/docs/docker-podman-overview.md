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

We are whitelisting the following network on all UbuntuRD systems, please make sure your containers are within the given range
172.17.0.0/16
Contact ubuntu-support@mercedes-benz.com if you need an exception

## Harbour proxy cache
Due to network access / traffic limitations, MB provides a pull-through proxy cache for the most common container registries

docker.io / dockerhub
quay.io
k8s
..etc


Taking docker.io/dockerhub as an example:

To pull official images you have to use /library/ in your docker pull command:

```bash
docker pull <endpoint>/dockerhub/library/<image>:<tag>
```

To pull un-official images use the below syntax:

```bash
docker pull <endpoint>/dockerhub/<reponame>/<image>:<tag>
```

Please consult the documentation below for detailed instructions and a recent list of supported repositories
https://git.i.mercedes-benz.com/DHC/DHC-Container-Registry/blob/main/technical-information/4-working-with-images/proxy-cache.md

Internal registries:
https://git.i.mercedes-benz.com/DHC/DHC-Container-Registry/blob/main/README.md#registry-endpoints

Registry endpoints
Our DHC Container Registry (Harbor) is available in the following regions:

| Region    | URL                                                                                       | Version
| ---       | ---                                                                                       | ---
| EMEA      | [https://registry.app.corpintra.net](https://registry.app.corpintra.net)                  | v2.8.2
| EMEA AWS  | [https://registry-emea.app.corpintra.net](https://registry-emea.app.corpintra.net)        | v2.8.2
| NAFTA     | [https://registry-americas.app.corpintra.net](https://registry-americas.app.corpintra.net)| v2.8.2
| CHINA     | [https://reg-dhc-china.app.corpintra.net](https://reg-dhc-china.app.corpintra.net)        | v2.8.2

