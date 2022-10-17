---
title: circle-ci
sidebar_position: 4
---

# Integrating Scribe in your CircleCI pipeline using Orbs

<!---
[![CircleCI Build Status](https://circleci.com/gh/scribe-security/orbs.svg?style=shield "CircleCI Build Status")](https://circleci.com/gh/scribe-security/orbs) [![CircleCI Orb Version](https://badges.circleci.com/orbs/scribe-security/orbs.svg)](https://circleci.com/orbs/registry/orb/scribe-security/orbs) [![GitHub License](https://img.shields.io/badge/license-MIT-lightgrey.svg)](https://raw.githubusercontent.com/scribe-security/orbs/master/LICENSE) [![CircleCI Community](https://img.shields.io/badge/community-CircleCI%20Discuss-343434.svg)](https://discuss.circleci.com/c/ecosystem/orbs)

--->
## Before you begin
Integrating Scribe Hub with Jenkins requires the following credentials that are found in the product setup dialog (In your **[Scribe Hub](https://prod.hub.scribesecurity.com/ "Scribe Hub Link")** go to **Home>Products>[$product]>Setup**)

* **Product Key**
* **Client ID**
* **Client Secret**

>Note that the product key is unique per product, while the client ID and secret are unique for your account.

## Scribe CircleCI Orbs

[CircleCI 'Orbs'](https://circleci.com/developer/orbs "Circle CI Orbs") are code snippets shared in a registry, to simplify configuration of builds on CircleCI.

Scribe offers CircleCI Orbs for embedding evidence collecting and integrity verification to your workflows. 

# Procedure
* Set your Scribe credentials as environment variables according to [CircleCI instructions](https://circleci.com/docs/env-vars#setting-an-environment-variable-in-a-project).
* Follow instructions and examples on the [ScribeHub Orb](https://circleci.com/developer/orbs/orb/scribe-security/orbs "Instructions for using ScribeHub Orb")



---

## Resources

[CircleCI Orb Registry Page](https://circleci.com/orbs/registry/orb/scribe-security/orbs) - The official registry page of this orb for all versions, executors, commands, and jobs described.

[CircleCI Orb Docs](https://circleci.com/docs/2.0/orb-intro/#section=configuration) - Docs for using, creating, and publishing CircleCI Orbs.