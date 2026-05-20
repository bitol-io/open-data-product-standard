---
title: "Definition: Open Data Product Standard (ODPS)"
description: "Details of the Open Data Product Standard (ODPS). Includes fundamentals, datasets, schemas, data quality, pricing, stakeholders, roles, service-level agreements and other properties."
image: "https://raw.githubusercontent.com/bitol-io/artwork/main/horizontal/color/Bitol_Logo_color.svg"
---

# Open Data Product Standard

## Executive Summary
This document describes the keys and values expected in a YAML data product, per the **Open Data Product Standard** (ODPS). The ODPS YAML file serves as the primary configuration and documentation for data products within your organization. This document explains each section of the standard, its purpose, and how to properly write it.

## Table of content

1. [Fundamentals](#fundamentals)
1. [Product Information](#product-information)
1. [Context (AI and semantic guidance)](#context)
1. [Management Ports](#management-ports)
1. [Support and Communication Channels](#support-and-communication-channels)
1. [Team](#team)
1. [Ancillary Objects: Custom Properties](#custom-properties)
1. [Ancillary Objects: Authoritative Definitions](#authoritative-definitions)
1. [Other Properties](#other-properties)

## Fundamentals

The core metadata section defines the fundamental identifying information required for the data product.

### Example

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

### Field Descriptions

| Key                                  | Type   | UX label                  | Required | Description                                                                                                                                                       | Example                              |
| ------------------------------------ | ------ | ------------------------- | -------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------ |
| apiVersion                           | string | Standard version          | Yes      | Version of the standard used to build data product. Default value is `v1.1.0`.                                                                                    | v1.1.0                               |
| kind                                 | string | Kind                      | Yes      | The kind of file this is. Valid value is `DataProduct`.                                                                                                           | DataProduct                          |
| **id**                               | string | ID                        | Yes      | A unique identifier used to reduce the risk of dataset name collisions, such as a UUID.                                                                           | 064c4630-8aad-4dc0-ba95-0f69940e6b18 |
| name                                 | string | Name                      | No       | Name of the data product.                                                                                                                                         |                                      |
| version                              | string | Version                   | No       | Current version of the data product. Not required, but highly recommended.                                                                                        | v1.0.0                               |
| status                               | string | Status                    | Yes      | Current status of the data product. Valid values are "proposed", "draft", "active", "deprecated", "retired".                                                      |                                      |
| domain                               | string | Domain                    | No       | Business domain                                                                                                                                                   | Customer                             |
| type                                 | string | Type                      | No       | Architectural type of the data product. Common values: `sourceAligned`, `aggregate`, `consumerAligned`. Organizations may define custom types. (Added in v1.1.0.) | aggregate                            |
| tenant                               | string | Tenant                    | No       | Organization identifier                                                                                                                                           | RetailCorp                           |
| context                              | object | Context                   | No       | AI and semantic context block. See [Context](#context). (Added in v1.1.0.)                                                                                        |                                      |
| description                          | object | Description               | No       | Object containing the descriptions.                                                                                                                               |                                      |
| description.purpose                  | string | Purpose                   | No       | Intended purpose for the provided data.                                                                                                                           |                                      |
| description.limitations              | string | Limitations               | No       | Technical, compliance, and legal limitations for data use.                                                                                                        |                                      |
| description.usage                    | string | Usage                     | No       | Recommended usage of the data.                                                                                                                                    |                                      |
| description.authoritativeDefinitions | array  | Authoritative Definitions | No       | See Authoritative Definitions below.                                                                                                                              |                                      |
| description.customProperties         | array  | Custom Properties         | No       | See Custom Properties below.                                                                                                                                      |                                      |
| customProperties                     | array  | Custom Properties         | No       | See Custom Properties below.                                                                                                                                      |                                      |
| authoritativeDefinitions             | array  | Authoritative Definitions | No       | See Authoritative Definitions below.                                                                                                                              |                                      |
| tags                                 | array  | Tags                      | No       | Tags as a list                                                                                                                                                    | ['customer', 'sales']                |

## Product information

Describe the core of the product, including the input and output ports.

### Example

```yaml
inputPorts: # Expectations [Optional]
- name: payments 
  version: v1.0.0 # [Required]
  contractId: dbb7b1eb-7628-436e-8914-2a00638ba6db # [Required]
- name: payments
  version: v2.0.0 # [Required]
  contractId: dbb7b1eb-7628-436e-8914-2a00638ba6da # [Required]
- name: onlinetransactions
  version: v1.0.0 # [Required]
  contractId: ec2a112d-5cfe-49f3-8760-f9cfb4597544 # [Required]
- name: onlinetransactions
  version: v1.1.0 # [Required]
  contractId: ec2a112d-5cfe-49f3-8760-f9cfb4597547 # [Required]

outputPorts: # Promises [Required]
- name: rawtransactions
  description: "Raw Transactions"
  type: tables
  version: v1.0.0 # [Required]
  contractId: c2798941-1b7e-4b03-9e0d-955b1a872b32 # [Required]
- name: rawtransactions
  description: "Raw Transactions"
  type: tables
  version: v2.0.0 # [Required]
  contractId: c2798941-1b7e-4b03-9e0d-955b1a872b33 # [Required]
  sbom: # The SBOM can/should be at the version level [Optional]
  - type: "external" # default
    url: "https://mysbomserver/mysbom"
  inputContracts: # or dependencies [Optional]
  - id: dbb7b1eb-7628-436e-8914-2a00638ba6db # or contractId
    version: v2.0.0
  - id: ec2a112d-5cfe-49f3-8760-f9cfb4597544
    version: v1.0.0
        
- name: consolidatedtransactions 
  description: "Consolidated transactions"
  type: tables
  version: v1.0.0
  contractId: a44978be-1fe0-4226-b840-1b715bc25c63
    
- name: fulltransactionswithreturns 
  description: "Full transactions with returns"
  type: tables
  version: v0.3.0
  contractId: ef769969-0cbe-4188-876f-bb00abadaee4
```

| Key                                    | Type   | UX label                  | Required | Description                                                                                                            |
| -------------------------------------- | ------ | ------------------------- | -------- | ---------------------------------------------------------------------------------------------------------------------- |
| inputPorts                             | array  | Input Ports               | No       | List of objects describing an input port. You need at least one as a data product needs to get data somewhere.         |
| inputPorts[].**name**                  | string | Name                      | Yes      | Name of the input port.                                                                                                |
| inputPorts[].version**                 | string | Version                   | No       | Version of the referenced data contract. The combination of `name` and `version` is the key of the input port.         |
| inputPorts[].contractId**              | string | Contract Id               | No       | Identifier of the data contract this input port references. An input port without a contract reference has no meaning. |
| inputPorts[].customProperties          | array  | Custom properties         | No       | Custom properties.                                                                                                     |
| inputPorts[].authoritativeDefinitions  | array  | Authoritative Definitions | No       | Authoritative definitions.                                                                                             |
| inputPorts[].tags                      | array  | Tags                      | No       | Tags.                                                                                                                  |
| outputPorts                            | array  | Output Ports              | Yes      | List of objects describing an output port. You need at least one, as a data product without output is useless.         |
| outputPorts[].**name**                 | string | Name                      | Yes      |                                                                                                                        |
| outputPorts[].version                  | string | Version                   | No       | Version of the data contract associated to this output port, becomes the version of the output port.                   |
| outputPorts[].contractId               | string | Contract Id               | No       |                                                                                                                        |
| outputPorts[].type                     | string | Type                      | No       | There can be different types of output ports, each automated and handled differently. Here you can indicate the type.  |
| outputPorts[].sbom                     | array  | SBOM                      | No       | Software Bill of Material.                                                                                             |
| outputPorts[].sbom[].type              | string | Type of SBOM              | No       | `external` is the default and only supported value.                                                                    |
| outputPorts[].sbom[].url               | string | URL                       | No       | URL to download the Software Bill of Materials.                                                                        |
| outputPorts[].description              | string | Description               | No       | Human-readable short description of the output port.                                                                   |
| outputPorts[].customProperties         | array  | Custom properties         | No       | Custom properties.                                                                                                     |
| outputPorts[].authoritativeDefinitions | array  | Authoritative Definitions | No       | Authoritative definitions.                                                                                             |
| outputPorts[].tags                     | array  | Tags                      | No       | Tags.                                                                                                                  |


## Context

Added in **ODPS v1.1.0** (RFC-0038). The `context` block provides structured, human- and machine-readable guidance for AI agents, LLMs, BI tools, and semantic layer platforms. It is optional and additive.

In ODPS, `context` is applicable at two levels:

- **Data product (top level)** — overall AI context for the product: which questions it can answer, which output port to use for what purpose.
- **Output port** — guidance on how to consume a specific port: access patterns, recommended query approach, format hints.

Input ports do not define their own `context`. AI agents consuming a data product should refer to the `context` defined on the ODCS data contract linked from the input port.

### Example

```yaml
context:
  instructions: >
    This data product exposes an enterprise view of a customer for self-service
    analytics and AI agents. Use the 'consolidatedtransactions' output port for
    aggregated transaction history. Refresh latency is 4 hours.
  verifiedStatements:
    - question: "What was the total customer spend last quarter?"
    - id: lifetime-value
      question: "What is the lifetime value of a customer?"
      answer: "Sum total_amount on consolidatedtransactions grouped by customer_id."
  constraints:
    - id: no-pii-exposure
      constraint: "Do not expose individual customer PII; aggregate to at least country level."
      tags: ['gdpr', 'pii']
    - constraint: "Do not use for real-time decisions; data latency is 4 hours."
```

### Field Descriptions

| Key                                                   | Type   | UX label                  | Required | Description                                                                                                                                                                                                          |
| ----------------------------------------------------- | ------ | ------------------------- | -------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| context.instructions                                  | string | Instructions              | No       | Natural language guidance for AI agents and tools on how to use this entity. Equivalent to a system prompt scoped to this level.                                                                                     |
| context.verifiedStatements                            | array  | Verified Statements       | No       | Canonical business questions, each with an optional curated answer. Entries with `answer` should be returned verbatim when a query is semantically close; entries without `answer` are sample questions for priming. |
| context.verifiedStatements[].id                       | string | ID                        | No       | Stable identifier for the entry.                                                                                                                                                                                     |
| context.verifiedStatements[].**question**             | string | Question                  | Yes      | The canonical question.                                                                                                                                                                                              |
| context.verifiedStatements[].answer                   | string | Answer                    | No       | The expected response or result description.                                                                                                                                                                         |
| context.verifiedStatements[].authoritativeDefinitions | array  | Authoritative Definitions | No       | Links to glossary, taxonomy, ontology, or other authoritative sources backing this entry.                                                                                                                            |
| context.verifiedStatements[].tags                     | array  | Tags                      | No       | Free-form tags for filtering, grouping, or routing entries.                                                                                                                                                          |
| context.verifiedStatements[].customProperties         | array  | Custom Properties         | No       | Custom properties.                                                                                                                                                                                                   |
| context.constraints                                   | array  | Constraints               | No       | Negative guidance: what AI agents must NOT do with this entity.                                                                                                                                                      |
| context.constraints[].id                              | string | ID                        | No       | Stable identifier for the constraint.                                                                                                                                                                                |
| context.constraints[].**constraint**                  | string | Constraint                | Yes      | The constraint text (negative guidance for AI agents).                                                                                                                                                               |
| context.constraints[].authoritativeDefinitions        | array  | Authoritative Definitions | No       | Links to policy, regulation, glossary, or other authoritative sources backing this constraint.                                                                                                                       |
| context.constraints[].tags                            | array  | Tags                      | No       | Free-form tags for filtering, grouping, or routing constraints.                                                                                                                                                      |
| context.constraints[].customProperties                | array  | Custom Properties         | No       | Custom properties.                                                                                                                                                                                                   |

For the full normative specification of cascading behavior between levels, see [RFC-0038](https://github.com/bitol-io/tsc/blob/main/rfcs/approved/odcs-v3.2.0/0038-context.md).

## Management Ports
The management ports define access points for managing the data product.

### Example

```yaml
managementPorts: 
- content: dictionary
  type: topic
  name: tpc-dict-update
  description: Kafka topic for dictionary updates
```

### Field Descriptions

| Field                                      | Type   | UX label                  | Required | Description                                                       |
| ------------------------------------------ | ------ | ------------------------- | -------- | ----------------------------------------------------------------- |
| managementPorts                            | array  | Management Interface      | No       | Object defining a management port.                                |
| managementPorts[].**name**                 | string | Name                      | Yes      | Endpoint identifier or unique name.                               |
| managementPorts[].content                  | string | Content                   | Yes      | Content: can be `discoverability`, `observability`, or `control`. |
| managementPorts[].type                     | string | Type                      | No       | Type: can be `rest` or `topic`. Default is `rest`.                |
| managementPorts[].url                      | string | URL                       | No       | URL to access the endpoint.                                       |
| managementPorts[].channel                  | string | Channel                   | No       | Channel to communicate with the data product.                     |
| managementPorts[].description              | string | Description               | No       | Purpose and usage                                                 |
| managementPorts[].customProperties         | array  | Custom Properties         | No       | Custom properties block.                                          |
| managementPorts[].authoritativeDefinitions | array  | Authoritative Definitions | No       | Authoritative definitions block.                                  |
| managementPorts[].tags                     | array  | Tags                      | No       | Tags.                                                             |


## Support and Communication Channels
The structure describing "support and communication channels" is shared between all Bitol standards.

### Field Descriptions

| Key                                | Type   | UX label                  | Required | Description                                                                                                                       |
| ---------------------------------- | ------ | ------------------------- | -------- | --------------------------------------------------------------------------------------------------------------------------------- |
| support                            | array  | Support                   | No       | Top level for support channels.                                                                                                   |
| support[].channel                  | string | Channel                   | Yes      | Channel name or identifier.                                                                                                       |
| support[].url                      | string | Channel URL               | Yes      | Access URL using normal [URL scheme](https://en.wikipedia.org/wiki/URL#Syntax) (https, mailto, etc.).                             |
| support[].description              | string | Description               | No       | Description of the channel, free text.                                                                                            |
| support[].tool                     | string | Tool                      | No       | Name of the tool, value can be `email`, `slack`, `teams`, `discord`, `ticket`, or `other`.                                        |
| support[].scope                    | string | Scope                     | No       | Scope can be: `interactive`, `announcements`, `issues`.                                                                           |
| support[].invitationUrl            | string | Invitation URL            | No       | Some tools uses invitation URL for requesting or subscribing. Follows the [URL scheme](https://en.wikipedia.org/wiki/URL#Syntax). |
| support[].customProperties         | array  | Custom Properties         | No       | Custom properties block.                                                                                                          |
| support[].authoritativeDefinitions | array  | Authoritative Definitions | No       | Authoritative definitions block.                                                                                                  |
| support[].tags                     | array  | Tags                      | No       | Tags as a list.                                                                                                                   |

## Team
The structure describing "team" is shared between all Bitol standards, matching RFC 0016.

### Field Descriptions

| Key                                     | Type   | UX label                  | Required | Description                                                                                |
| --------------------------------------- | ------ | ------------------------- | -------- | ------------------------------------------------------------------------------------------ |
| team                                    | object | Team                      | No       | Object representing a team.                                                                |
| team.name                               | string | Name                      | No       | Team name.                                                                                 |
| team.description                        | string | Description               | No       | Team description.                                                                          |
| team.customProperties                   | array  | Custom Properties         | No       | Custom properties block.                                                                   |
| team.authoritativeDefinitions           | array  | Authoritative Definitions | No       | Authoritative definitions block.                                                           |
| team.tags                               | array  | Tags                      | No       | Tags as a list.                                                                            |
| team.members                            | array  | Team Members              | No       | List of members                                                                            |
| team.members[].**username**             | string | Username                  | Yes      | The user's username or email.                                                              |
| team.members[].name                     | string | Name                      | No       | The user's name.                                                                           |
| team.members[].description              | string | Description               | No       | The user's name.                                                                           |
| team.members[].role                     | string | Role                      | No       | The user's job role; Examples might be owner, data steward. There is no limit on the role. |
| team.members[].dateIn                   | string | Date In                   | No       | The date when the user joined the team.                                                    |
| team.members[].dateOut                  | string | Date Out                  | No       | The date when the user ceased to be part of the team.                                      |
| team.members[].replacedByUsername       | string | Replaced By Username      | No       | The username of the user who replaced the previous user.                                   |
| team.members[].customProperties         | array  | Custom Properties         | No       | Custom properties block.                                                                   |
| team.members[].authoritativeDefinitions | array  | Authoritative Definitions | No       | Authoritative definitions block.                                                           |
| team.members[].tags                     | array  | Tags                      | No       | Tags as a list.                                                                            |

## Ancillary Objects

### Custom Properties
The structure describing "Custom Properties" is shared between all Bitol standards.

| Key                             | Type   | UX label          | Required | Description                                                                                                       |
| ------------------------------- | ------ | ----------------- | -------- | ----------------------------------------------------------------------------------------------------------------- |
| customProperties                | array  | Custom Properties | No       | A list of key/value pairs for custom properties.                                                                  |
| customProperties[].**property** | string | Property          | No       | The name of the key. Names should be in camel case–the same as if they were permanent properties in the contract. |
| customProperties[].value        | any    | Value             | No       | The value of the key.                                                                                             |
| customProperties[].description  | string | Description       | No       | Optional description.                                                                                             |

### Authoritative Definitions
The structure describing "Authoritative Definitions" is shared between all Bitol standards.

| Key                                    | Type   | UX label          | Required | Description                                                                                                                                                                                                                                                                    |
| -------------------------------------- | ------ | ----------------- | -------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| authoritativeDefinitions               | array  | Link              | No       | A list of type/link pairs for authoritative definitions.                                                                                                                                                                                                                       |
| authoritativeDefinitions[].**type**    | string | Definition type   | Yes      | Type of definition for authority. Recommended values are: `businessDefinition`, `transformationImplementation`, `videoTutorial`, `tutorial`, and `implementation`. At the root level, a type can also be `canonicalUrl` to indicate a reference to the product's last version. |
| authoritativeDefinitions[].url         | string | URL to definition | Yes      | URL to the authority.                                                                                                                                                                                                                                                          |
| authoritativeDefinitions[].description | string | Description       | No       | Optional description.                                                                                                                                                                                                                                                          |

## Other Properties

| Key              | Type   | UX label            | Required | Description                                                            |
| ---------------- | ------ | ------------------- | -------- | ---------------------------------------------------------------------- |
| productCreatedTs | string | Product Created UTC | No       | Timestamp in UTC of when the data product was created, using ISO 8601. |

All trademarks are the property of their respective owners. 
