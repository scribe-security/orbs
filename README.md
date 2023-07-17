---
sidebar_label: "CircleCI"
title: CircleCI
sidebar_position: 5
---

Scribe offers CircleCI Orbs for embedding evidence collecting and integrity verification to your workflows.

The Orb provides several actions enabling the generation of SBOMs from various sources.
The usage examples on this page demonstrate several use cases of SBOM collection (SBOM from a publicly available Docker image, SBOM from a Git repository,
SBOM from a local directory) as well as several use cases of uploading the evidence either to the Circle CI workspace or to the Scribe Service.

<!-- -
[![CircleCI Build Status](https://circleci.com/gh/scribe-security/orbs.svg?style=shield "CircleCI Build Status")](https://circleci.com/gh/scribe-security/orbs) [![CircleCI Orb Version](https://badges.circleci.com/orbs/scribe-security/orbs.svg)](https://circleci.com/orbs/registry/orb/scribe-security/orbs) [![GitHub License](https://img.shields.io/badge/license-MIT-lightgrey.svg)](https://raw.githubusercontent.com/scribe-security/orbs/master/LICENSE) [![CircleCI Community](https://img.shields.io/badge/community-CircleCI%20Discuss-343434.svg)](https://discuss.circleci.com/c/ecosystem/orbs)
- -->

### Usage

_For full usage guidelines, see the [orb registry listing](https://circleci.com/developer/orbs/orb/scribe-security/orbs)._

### Target types - `[target]`
---
Target types are types of artifacts produced and consumed by your supply chain.
Using supported targets, you can collect evidence and verify compliance on a range of artifacts.

> Fields specified as [target] support the following format.

### Format

`[scheme]:[name]:[tag]` 

| Sources | target-type | scheme | Description | example
| --- | --- | --- | --- | --- |
| Docker Daemon | image | docker | use the Docker daemon | docker:busybox:latest |
| OCI registry | image | registry | use the docker registry directly | registry:busybox:latest |
| Docker archive | image | docker-archive | use a tarball from disk for archives created from "docker save" | image | docker-archive:path/to/yourimage.tar |
| OCI archive | image | oci-archive | tarball from disk for OCI archives | oci-archive:path/to/yourimage.tar |
| Remote git | git| git | remote repository git | git:https://github.com/yourrepository.git |
| Local git | git | git | local repository git | git:path/to/yourrepository | 
| Directory | dir | dir | directory path on disk | dir:path/to/yourproject | 
| File | file | file | file path on disk | file:path/to/yourproject/file | 

> Use `setup_remote_docker` step (Optional) to allow access to a local docker daemon. Otherwise image targets is read directly from remote registry.

### Evidence Stores
Each storer can be used to store, find and download evidence, unifying all the supply chain evidence into a system is an important part to be able to query any subset for policy validation.

| Type  | Description | requirement |
| --- | --- | --- |
| scribe | Evidence is stored on scribe service | scribe credentials |
| OCI | Evidence is stored on a remote OCI registry | access to a OCI registry |

### Scribe Evidence store
Scribe evidence store allows you store evidence using scribe Service.

Related Flags:
> Note the flag set:
>* `scribe-client-id`
>* `scribe-client-secret`
>* `scribe-enable`

### Before you begin
Integrating Scribe Hub with your environment requires the following credentials that are found in the **Integrations** page. (In your **[Scribe Hub](https://prod.hub.scribesecurity.com/ "Scribe Hub Link")** go to **integrations**)

* **Client ID**
* **Client Secret**

<img src='../../../../img/ci/integrations-secrets.jpg' alt='Scribe Integration Secrets' width='70%' min-width='400px'/>

* Set your Scribe credentials as environment variables according to [CircleCI environment variables instructions](https://circleci.com/docs/env-vars#setting-an-environment-variable-in-a-project "CircleCI embedding environment variables instructions").
* Follow instructions and examples on the CircleCI [ScribeHub Orb page](https://circleci.com/developer/orbs/orb/scribe-security/orbs "Instructions for using ScribeHub Orb")

### OCI Evidence store
Valint supports both storage and verification flows for `attestations`  and `statement` objects utilizing OCI registry as an evidence store.

Using OCI registry as an evidence store allows you to upload, download and verify evidence across your supply chain in a seamless manner.

Related flags:
* `oci` Enable OCI store.
* `oci-repo` - Evidence store location.

### Before you begin
Evidence can be stored in any accusable registry.
* Write access is required for upload (generate).
* Read access is required for download (verify).

You must first login with the required access privileges to your registry before calling Valint.
For example, using `docker login` command or [circle orbs](https://circleci.com/docs/building-docker-images/).

### Scribe CircleCI Orbs

[CircleCI 'Orbs'](https://circleci.com/developer/orbs "Circle CI Orbs") are shareable packages of CircleCI configuration code snippets. They are often shared in a registry and used to simplify configuration of builds on CircleCI.
Scribe offers custom CircleCI Orbs for easier integration of CircleCI workflows with Scribe Hub. The custom Orbs are used for evidence collection and integrity verification in your workflows.

---

### Resources

* [CircleCI ScribeHub Orb Registry Page](https://circleci.com/orbs/registry/orb/scribe-security/orbs) - The official registry page of the ScribeHub orb for all versions, executors, commands, and jobs described.
* [CircleCI Orb Docs](https://circleci.com/docs/2.0/orb-intro/#section=configuration) - Docs for using, creating, and publishing CircleCI Orbs.