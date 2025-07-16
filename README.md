---
sidebar_label: "CircleCI"
title: CircleCI
sidebar_position: 5
---

Use the following instructions to integrate your CircleCI with Scribe.

### 1. Obtain a Scribe Hub API Token

Create an API token in [Scribe Hub > Account > Tokens](https://app.scribesecurity.com/account/tokens). Copy it to a safe temporary notepad until you complete the integration.

:::note Important
The token is a secret and will not be accessible from the UI after you finalize the token generation. 
:::

### 2. Add the API token to the CircleCI secrtes

Add the Scribe Hub API token as SCRIBE_TOKEN to your CircleCI environment by following the [CircleCI environment variables instructions](https://circleci.com/docs/env-vars#setting-an-environment-variable-in-a-project "CircleCI embedding environment variables instructions")

### 3. Install Scribe CLI and usage

**Valint**(Scribe CLI) is required to generate evidence in such as SBOMs and SLSA provenance. 
Installation instructions and usage examples can be found on the [Scribe Security Orb page](https://circleci.com/developer/orbs/orb/scribe-security/orbs)


### Alternative evidence stores

> You can learn more about alternative stores **[here](https://scribe-security.netlify.app/docs/integrating-scribe/other-evidence-stores)**.

<details>
  <summary> <b> OCI Evidence store </b></summary>

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
For example, using `docker login` command or **[circle orbs](https://circleci.com/docs/building-docker-images/)**.

</details>

### Scribe CircleCI Orbs

**[CircleCI 'Orbs'](https://circleci.com/developer/orbs "Circle CI Orbs")** are shareable packages of CircleCI configuration code snippets. They are often shared in a registry and used to simplify configuration of builds on CircleCI.
Scribe offers custom CircleCI Orbs for easier integration of CircleCI workflows with Scribe Hub. The custom Orbs are used for evidence collection and integrity verification in your workflows.

---

### Resources

* **[CircleCI ScribeHub Orb Registry Page](https://circleci.com/orbs/registry/orb/scribe-security/orbs)** - The official registry page of the ScribeHub orb for all versions, executors, commands, and jobs described.
* **[CircleCI Orb Docs](https://circleci.com/docs/2.0/orb-intro/#section=configuration)** - Docs for using, creating, and publishing CircleCI Orbs.
