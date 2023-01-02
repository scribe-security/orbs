---
title: CircleCI
sidebar_position: 3
---

# CircleCI
Scribe offers CircleCI Orbs for embedding evidence collecting and integrity verification to your workflows.

The Orb provides several actions enabling the generation of SBOMs from various sources.
The usage examples on this page demonstrate several use cases of SBOM collection (SBOM from a publicly available Docker image, SBOM from a Git repository,
SBOM from a local directory) as well as several use cases of uploading the evidence either to the Circle CI workspace or to the Scribe Service.

<!-- -
[![CircleCI Build Status](https://circleci.com/gh/scribe-security/orbs.svg?style=shield "CircleCI Build Status")](https://circleci.com/gh/scribe-security/orbs) [![CircleCI Orb Version](https://badges.circleci.com/orbs/scribe-security/orbs.svg)](https://circleci.com/orbs/registry/orb/scribe-security/orbs) [![GitHub License](https://img.shields.io/badge/license-MIT-lightgrey.svg)](https://raw.githubusercontent.com/scribe-security/orbs/master/LICENSE) [![CircleCI Community](https://img.shields.io/badge/community-CircleCI%20Discuss-343434.svg)](https://discuss.circleci.com/c/ecosystem/orbs)
- -->

## Usage

_For full usage guidelines, see the [orb registry listing](https://circleci.com/developer/orbs/orb/scribe-security/orbs)._

## Before you begin
Integrating Scribe Hub with CircleCI requires the following credentials that are found in the product setup dialog (In your **[Scribe Hub](https://prod.hub.scribesecurity.com/ "Scribe Hub Link")** go to **Home>Products>[$product]>Setup**)

* **Product Key**
* **Client ID**
* **Client Secret**

>Note that the product key is unique per product, while the client ID and secret are unique for your account.

## Scribe CircleCI Orbs

[CircleCI 'Orbs'](https://circleci.com/developer/orbs "Circle CI Orbs") are shareable packages of CircleCI configuration code snippets. They are often shared in a registry and used to simplify configuration of builds on CircleCI.
Scribe offers custom CircleCI Orbs for easier integration of CircleCI workflows with Scribe Hub. The custom Orbs are used for evidence collection and integrity verification in your workflows.

# Procedure
* Set your Scribe credentials as environment variables according to [CircleCI environment variables instructions](https://circleci.com/docs/env-vars#setting-an-environment-variable-in-a-project "CircleCI embedding environment variables instructions").
* Follow instructions and examples on the CircleCI [ScribeHub Orb page](https://circleci.com/developer/orbs/orb/scribe-security/orbs "Instructions for using ScribeHub Orb")

---

## Resources

* [CircleCI ScribeHub Orb Registry Page](https://circleci.com/orbs/registry/orb/scribe-security/orbs) - The official registry page of the ScribeHub orb for all versions, executors, commands, and jobs described.
* [CircleCI Orb Docs](https://circleci.com/docs/2.0/orb-intro/#section=configuration) - Docs for using, creating, and publishing CircleCI Orbs.