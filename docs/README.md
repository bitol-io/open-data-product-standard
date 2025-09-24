---
title: "Definition: Open Data Product Standard (ODPS)"
description: "Details of the Open Data Product Standard (ODPS). Includes fundamentals, datasets, schemas, data quality, pricing, stakeholders, roles, service-level agreements and other properties."
image: "https://raw.githubusercontent.com/bitol-io/artwork/main/horizontal/color/Bitol_Logo_color.svg"
---

# Open Data Product Standard

## Executive Summary
This document describes the keys and values expected in a YAML data product, per the **Open Data Product Standard** (ODPS). The Open Data Product Standard YAML file serves as the primary configuration and documentation for data products within your organization. This document explains each section of the standard, its purpose, and how to properly write it.

## Table of content

1. [Fundamentals](#fundamentals)
1. [Product Information](#product-information)
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
apiVersion: v1.0.0
kind: DataProduct

name: Customer Data Product
id: fbe8d147-28db-4f1d-bedf-a3fe9f458427
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

| Key                                  | Key | UX label                  | Required | Description                                                                                                   | Example                              |
|--------------------------------------|-----|---------------------------|----------|---------------------------------------------------------------------------------------------------------------|--------------------------------------|
| apiVersion                           |     | Standard version          | Yes      | Version of the standard used to build data product. Default value is `v1.0.0`.                                | v1.0.0                               |
| kind                                 |     | Kind                      | Yes      | The kind of file this is. Valid value is `DataProduct`.                                                       | DataProduct                          |
| **id**                               | Yes | ID                        | Yes      | A unique identifier used to reduce the risk of dataset name collisions, such as a UUID.                       | 064c4630-8aad-4dc0-ba95-0f69940e6b18 |
| name                                 |     | Name                      | No       | Name of the data product.                                                                                     |                                      |
| version                              |     | Version                   | No       | Current version of the data product. Not required, but highly recommended.                                    | v1.0.0                               |
| status                               |     | Status                    | Yes      | Current status of the data product. Valid values are "proposed", "draft", "active", "deprecated", "retired".  |                                      |
| domain                               |     | Domain                    | No       | Business domain                                                                                               | Customer                             |
| tenant                               |     | Tenant                    | No       | Organization identifier                                                                                       | RetailCorp                           |
| authoritativeDefinitions             |     | Authoritative Definitions | No       | List of links to sources that provide more details on the data contract.                                      |                                      |
| description                          |     | Description               | No       | Object containing the descriptions.                                                                           |                                      |
| description.purpose                  |     | Purpose                   | No       | Intended purpose for the provided data.                                                                       |                                      |
| description.limitations              |     | Limitations               | No       | Technical, compliance, and legal limitations for data use.                                                    |                                      |
| description.usage                    |     | Usage                     | No       | Recommended usage of the data.                                                                                |                                      |
| description.authoritativeDefinitions |     | Authoritative Definitions | No       | See Authoritative Definitions below.                                                                          |                                      |
| description.customProperties         |     | Custom Properties         | No       | See Custom Properties below.                                                                                  |                                      |
| customProperties                     |     | Custom Properties         | No       | See Custom Properties below.                                                                                  |                                      |
| authoritativeDefinitions             |     | Authoritative Definitions | No       | See Authoritative Definitions below.                                                                          |                                      |
| tags                                 |     | Tags                      | No       | Tags as a list                                                                                                | ['customer', 'sales']                |

## Product information

Describe the core of the product.

### Example

```yaml
inputPorts: # Expectations [Optional]
- name: payments 
  version: 1.0.0 # [Required]
  contractId: dbb7b1eb-7628-436e-8914-2a00638ba6db # [Required]
- name: payments
  version: 2.0.0 # [Required]
  contractId: dbb7b1eb-7628-436e-8914-2a00638ba6da # [Required]
- name: onlinetransactions
  version: 1.0.0 # [Required]
  contractId: ec2a112d-5cfe-49f3-8760-f9cfb4597544 # [Required]
- name: onlinetransactions
  version: 1.1.0 # [Required]
  contractId: ec2a112d-5cfe-49f3-8760-f9cfb4597547 # [Required]

outputPorts: # Promises [Required]
- name: rawtransactions
  description: "Raw Transactions"
  type: tables
  version: 1.0.0 # [Required]
  contractId: c2798941-1b7e-4b03-9e0d-955b1a872b32 # [Required]
- name: rawtransactions
  description: "Raw Transactions"
  type: tables
  version: 2.0.0 # [Required]
  contractId: c2798941-1b7e-4b03-9e0d-955b1a872b33 # [Required]
  sbom: # The SBOM can/should be at the version level [Optional]
  - type: "external" # default
    url: "https://mysbomserver/mysbom"
  inputContracts: # or dependencies [Optional]
  - id: dbb7b1eb-7628-436e-8914-2a00638ba6db # or contractId
    version: 2.0.0
  - id: ec2a112d-5cfe-49f3-8760-f9cfb4597544
    version: 1.0.0
        
- name: consolidatedtransactions 
  description: "Consolidated transactions"
  type: tables
  version: 1.0.0
  contractId: a44978be-1fe0-4226-b840-1b715bc25c63
    
- name: fulltransactionswithreturns 
  description: "Full transactions with returns"
  type: tables
  version: 0.3.0
  contractId: ef769969-0cbe-4188-876f-bb00abadaee4
```

| Key                                  | Key | UX label                  | Required | Description                                                                                                                                                                                |
|--------------------------------------|-----|---------------------------|----------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| inputPorts                           |     | Input Ports               | No       | List of objects describing an input port. You need at least one as a data product needs to get data somewhere.                                                                             |
| inputPorts.**name**                  | Yes | Name                      | Yes      |                                                                                                                                                                                            |
| inputPorts.version                   |     | Version                   | No       | For each version, a different instance of the output port is listed. The combination of the name and version is the key. A new (major) version would be a new output port, for simplicity. |
| inputPorts.contractId                |     | Contract Id               | No       |                                                                                                                                                                                            |
| inputPorts.customProperties          |     | Custom properties         | No       | Custom properties.                                                                                                                                                                         |
| inputPorts.authoritativeDefinitions  |     | Authoritative Definitions | No       | Authoritative definitions.                                                                                                                                                                 |
| inputPorts.tags                      |     | Tags                      | No       | Tags.                                                                                                                                                                                      |
| outputPorts                          |     | Output Ports              | Yes      | List of objects describing an output port. You need at least one, as a data product without output is useless.                                                                             |
| outputPorts.**name**                 | Yes | Name                      | Yes      |                                                                                                                                                                                            |
| outputPorts.version                  |     | Version                   | No       | For each version, a different instance of the output port is listed. The combination of the name and version is the key. A new (major) version would be a new output port, for simplicity. |
| outputPorts.contractId               |     | Contract Id               | No       |                                                                                                                                                                                            |
| outputPorts.type                     |     | Type                      | No       | There can be different types of output ports, each automated and handled differently. Here you can indicate the type.                                                                      |
| outputPorts.description              |     | Description               | No       | Human readable short description of the output port.                                                                                                                                       |
| outputPorts.customProperties         |     | Custom properties         | No       | Custom properties.                                                                                                                                                                         |
| outputPorts.authoritativeDefinitions |     | Authoritative Definitions | No       | Authoritative definitions.                                                                                                                                                                 |
| outputPorts.tags                     |     | Tags                      | No       | Tags.                                                                                                                                                                                      |


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

| Field                                    | Key | UX label                  | Required | Description                                                       |
|------------------------------------------|-----|---------------------------|----------|-------------------------------------------------------------------|
| managementPorts                          |     | Management Interface      | No       | Object defining a management port.                                |
| managementPorts.**name**                 | Yes | Name                      | Yes      | Endpoint identifier or unique name.                               |
| managementPorts.content                  |     | Content                   | Yes      | Content: can be `discoverability`, `observability`, or `control`. |
| managementPorts.type                     |     | Type                      | No       | Type: can be `rest` or `topic`. Default is `rest`.                |
| managementPorts.url                      |     | URL                       | No       | URL to access the endpoint.                                       |
| managementPorts.channel                  |     | Channel                   | No       | Channel to communicate with the data product.                     |
| managementPorts.description              |     | Description               | No       | Purpose and usage                                                 |
| managementPorts.customProperties         |     | Custom Properties         | No       | Custom properties block.                                          | 
| managementPorts.authoritativeDefinitions |     | Authoritative Definitions | No       | Authoritative definitions block.                                  | 
| managementPorts.tags                     |     | Tags                      | No       | Tags.                                                             | 


## Support and Communication Channels
The structure describing "support and communication channels" is shared between all Bitol standards.

### Field Descriptions

| Key                              | Key | UX label                  | Required | Description                                                                                                                       |
|----------------------------------|-----|---------------------------|----------|-----------------------------------------------------------------------------------------------------------------------------------|
| support                          |     | Support                   | No       | Top level for support channels.                                                                                                   |
| support.channel                  |     | Channel                   | Yes      | Channel name or identifier.                                                                                                       |
| support.url                      |     | Channel URL               | Yes      | Access URL using normal [URL scheme](https://en.wikipedia.org/wiki/URL#Syntax) (https, mailto, etc.).                             |
| support.description              |     | Description               | No       | Description of the channel, free text.                                                                                            |
| support.tool                     |     | Tool                      | No       | Name of the tool, value can be `email`, `slack`, `teams`, `discord`, `ticket`, or `other`.                                        |
| support.scope                    |     | Scope                     | No       | Scope can be: `interactive`, `announcements`, `issues`.                                                                           |
| support.invitationUrl            |     | Invitation URL            | No       | Some tools uses invitation URL for requesting or subscribing. Follows the [URL scheme](https://en.wikipedia.org/wiki/URL#Syntax). |
| support.customProperties         |     | Custom Properties         | No       | Custom properties block.                                                                                                          | 
| support.authoritativeDefinitions |     | Authoritative Definitions | No       | Authoritative definitions block.                                                                                                  | 
| support.tags                     |     | Tags                      | No       | Tags as a list.                                                                                                                   | 

## Team
The structure describing "team" is shared between all Bitol standards, matching RFC 0016.

### Field Descriptions

| Key                                   | Key | UX label                  | Required | Description                                                                                |
|---------------------------------------|-----|---------------------------|----------|--------------------------------------------------------------------------------------------|
| team                                  |     | Team                      | No       | Object representing a team.                                                                |
| team.name                             |     | Name                      | No       | Team name.                                                                                 |    
| team.description                      |     | Description               | No       | Team description.                                                                          |
| team.customProperties                 |     | Custom Properties         | No       | Custom properties block.                                                                   | 
| team.authoritativeDefinitions         |     | Authoritative Definitions | No       | Authoritative definitions block.                                                           | 
| team.tags                             |     | Tags                      | No       | Tags as a list.                                                                            | 
| team.members                          |     | Team Members              | No       | List of members                                                                            |
| team.members.**username**             | Yes | Username                  | Yes      | The user's username or email.                                                              |
| team.members.name                     |     | Name                      | No       | The user's name.                                                                           |
| team.members.description              |     | Description               | No       | The user's name.                                                                           |
| team.members.role                     |     | Role                      | No       | The user's job role; Examples might be owner, data steward. There is no limit on the role. |
| team.members.dateIn                   |     | Date In                   | No       | The date when the user joined the team.                                                    |
| team.members.dateOut                  |     | Date Out                  | No       | The date when the user ceased to be part of the team.                                      |
| team.members.replacedByUsername       |     | Replaced By Username      | No       | The username of the user who replaced the previous user.                                   |
| team.members.customProperties         |     | Custom Properties         | No       | Custom properties block.                                                                   | 
| team.members.authoritativeDefinitions |     | Authoritative Definitions | No       | Authoritative definitions block.                                                           | 
| team.members.tags                     |     | Tags                      | No       | Tags as a list.                                                                            | 

## Ancillary Objects

### Custom Properties
The structure describing "Custom Properties" is shared between all Bitol standards.

| Key                           | Key | UX label             | Required | Description                                                                                                       |
|-------------------------------|-----|----------------------|----------|-------------------------------------------------------------------------------------------------------------------|
| customProperties              |     | Custom Properties    | No       | A list of key/value pairs for custom properties.                                                                  |
| customProperties.**property** | Yes | Property             | No       | The name of the key. Names should be in camel case–the same as if they were permanent properties in the contract. |
| customProperties.value        |     | Value                | No       | The value of the key.                                                                                             |
| customProperties.description  |     | Description          | No       | Optional description.                                                                                             |

### Authoritative Definitions
The structure describing "Authoritative Definitions" is shared between all Bitol standards.

| Key                                  | Key | UX label          | Required | Description                                                                                                                                                                                                                                                                    |
|--------------------------------------|-----|-------------------|----------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| authoritativeDefinitions             |     | Link              | No       | A list of type/link pairs for authoritative definitions.                                                                                                                                                                                                                       |
| authoritativeDefinitions.**type**    | Yes | Definition type   | Yes      | Type of definition for authority. Recommended values are: `businessDefinition`, `transformationImplementation`, `videoTutorial`, `tutorial`, and `implementation`. At the root level, a type can also be `canonicalUrl` to indicate a reference to the product's last version. |
| authoritativeDefinitions.url         |     | URL to definition | Yes      | URL to the authority.                                                                                                                                                                                                                                                          |
| authoritativeDefinitions.description |     | Description       | No       | Optional description.                                                                                                                                                                                                                                                          |

## Other Properties

| Key              | Key | UX label            | Required | Description                                                             |
|------------------|-----|---------------------|----------|-------------------------------------------------------------------------|
| productCreatedTs |     | Product Created UTC | No       | Timestamp in UTC of when the data contract was created, using ISO 8601. |

All trademarks are the property of their respective owners. 
