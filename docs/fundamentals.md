---
title: "Fundamentals"
description: "Fundamental identifying information for the data product."
---

<!--
Copyright 2026 The Bitol Contributors
SPDX-License-Identifier: Apache-2.0
-->

# Fundamentals

The core metadata section defines the fundamental identifying information required for the data product.

[Back to TOC](README.md)

## Example

```yaml
apiVersion: v1.1.0
kind: DataProduct

name: Customer Data Product
id: fbe8d147-28db-4f1d-bedf-a3fe9f458427
type: aggregate
domain: seller
status: draft
tenant: RetailCorp

description:
  purpose: Enterprise view of a customer.
  limitations: No known limitations.
  usage: Check the various artefacts for their own description.

tags: ['customer']
```

## Field Descriptions

| Key                                  | Type   | UX label                  | Required | Description                                                                                                                                                       | Example                              |
| ------------------------------------ | ------ | ------------------------- |----------| ----------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------ |
| apiVersion                           | string | Standard version          | Yes      | Version of the standard used to build data product. Default value is `v1.1.0`.                                                                                    | v1.1.0                               |
| context                              | object | Context                   | No       | AI and semantic context block. See [Context](context.md). (Added in v1.1.0.)                                                                                      |                                      |
| deprecated                           | boolean| Deprecated                | No       | Indicates the data product is deprecated and should not be used in new implementations. Defaults to false. See [Deprecated](deprecated.md). (Added in v1.1.0.)    |                                      |
| domain                               | string | Domain                    | No       | Business domain                                                                                                                                                   | Customer                             |
| **id**                               | string | ID                        | Yes      | A unique identifier used to reduce the risk of dataset name collisions, such as a UUID.                                                                           | 064c4630-8aad-4dc0-ba95-0f69940e6b18 |
| kind                                 | string | Kind                      | Yes      | The kind of file this is. Valid value is `DataProduct`.                                                                                                           | DataProduct                          |
| name                                 | string | Name                      | No       | Name of the data product.                                                                                                                                         |                                      |
| status                               | string | Status                    | No       | Current status of the data product. Valid values are "proposed", "draft", "active", "deprecated", "retired".                                                      |                                      |
| synonyms                             | array  | Synonyms                  | No       | A list of alternative names for the data product. See [Synonyms](synonyms.md). (Added in v1.1.0.)                                                                 |                                      |
| tenant                               | string | Tenant                    | No       | Organization identifier                                                                                                                                           | RetailCorp                           |
| type                                 | string | Type                      | No       | Architectural type of the data product. Common values: `sourceAligned`, `aggregate`, `consumerAligned`. Organizations may define custom types. (Added in v1.1.0.) | aggregate                            |
| version                              | string | Version                   | No       | Current version of the data product. Not required, but highly recommended.                                                                                        | v1.0.0                               |
| authoritativeDefinitions             | array  | Authoritative Definitions | No       | See Authoritative Definitions below.                                                                                                                              |                                      |
| tags                                 | array  | Tags                      | No       | Tags as a list                                                                                                                                                    | ['customer', 'sales']                |
| customProperties                     | array  | Custom Properties         | No       | See Custom Properties below.                                                                                                                                      |                                      |
| description                          | object | Description               | No       | Object containing the descriptions.                                                                                                                               |                                      |
| description.limitations              | string | Limitations               | No       | Technical, compliance, and legal limitations for data use.                                                                                                        |                                      |
| description.purpose                  | string | Purpose                   | No       | Intended purpose for the provided data.                                                                                                                           |                                      |
| description.usage                    | string | Usage                     | No       | Recommended usage of the data.                                                                                                                                    |                                      |
| description.authoritativeDefinitions | array  | Authoritative Definitions | No       | See Authoritative Definitions below.                                                                                                                              |                                      |
| description.customProperties         | array  | Custom Properties         | No       | See Custom Properties below.                                                                                                                                      |                                      |
