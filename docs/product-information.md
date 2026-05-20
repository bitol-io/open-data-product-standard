---
title: "Product Information"
description: "Input and output ports of the data product."
---

# Product Information

Describe the core of the product, including the input and output ports.

[Back to TOC](README.md)

## Example

```yaml
inputPorts: # Expectations [Optional]
- name: payments 
  version: v1.0.0 # [Optional]
  contractId: dbb7b1eb-7628-436e-8914-2a00638ba6db # [Optional]
- name: payments
  version: v2.0.0 # [Optional]
  contractId: dbb7b1eb-7628-436e-8914-2a00638ba6da # [Optional]
- name: onlinetransactions
  version: v1.0.0 # [Optional]
  contractId: ec2a112d-5cfe-49f3-8760-f9cfb4597544 # [Optional]
- name: onlinetransactions
  version: v1.1.0 # [Optional]
  contractId: ec2a112d-5cfe-49f3-8760-f9cfb4597547 # [Optional]

outputPorts: # Promises [Required]
- name: rawtransactions
  description: "Raw Transactions"
  type: tables
  version: v1.0.0 # [Optional]
  contractId: c2798941-1b7e-4b03-9e0d-955b1a872b32 # [Optional]
- name: rawtransactions
  description: "Raw Transactions"
  type: tables
  version: v2.0.0 # [Optional]
  contractId: c2798941-1b7e-4b03-9e0d-955b1a872b33 # [Optional]
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

## Field Descriptions

| Key                                        | Type   | UX label                  | Required | Description                                                                                                                            |
| ------------------------------------------ | ------ | ------------------------- | -------- | -------------------------------------------------------------------------------------------------------------------------------------- |
| inputPorts                                 | array  | Input Ports               | No       | List of objects describing an input port.                                                                                              |
| inputPorts[].contractId                    | string | Contract Id               | No       | Identifier of the data contract this input port references. An input port without a contract reference has no meaning.                 |
| inputPorts[].id                            | string | ID                        | No       | A unique identifier for the element used to create stable, refactor-safe references. Recommended for elements that will be referenced. |
| inputPorts[].**name**                      | string | Name                      | Yes      | Name of the input port.                                                                                                                |
| inputPorts[].version                       | string | Version                   | No       | Version of the referenced data contract. The combination of `name` and `version` is the key of the input port.                         |
| inputPorts[].authoritativeDefinitions      | array  | Authoritative Definitions | No       | Authoritative definitions.                                                                                                             |
| inputPorts[].tags                          | array  | Tags                      | No       | Tags.                                                                                                                                  |
| inputPorts[].customProperties              | array  | Custom properties         | No       | Custom properties.                                                                                                                     |
| outputPorts                                | array  | Output Ports              | Yes      | List of objects describing an output port. You need at least one, as a data product without output is useless.                         |
| outputPorts[].context                      | object | Context                   | No       | AI and semantic context for consuming this output port. See [Context](context.md). (Added in v1.1.0.)                                  |
| outputPorts[].contractId                   | string | Contract Id               | No       |                                                                                                                                        |
| outputPorts[].description                  | string | Description               | No       | Human-readable short description of the output port.                                                                                   |
| outputPorts[].id                           | string | ID                        | No       | A unique identifier for the element used to create stable, refactor-safe references. Recommended for elements that will be referenced. |
| outputPorts[].**name**                     | string | Name                      | Yes      |                                                                                                                                        |
| outputPorts[].type                         | string | Type                      | No       | There can be different types of output ports, each automated and handled differently. Here you can indicate the type.                  |
| outputPorts[].version                      | string | Version                   | No       | Version of the data contract associated to this output port, becomes the version of the output port.                                   |
| outputPorts[].authoritativeDefinitions     | array  | Authoritative Definitions | No       | Authoritative definitions.                                                                                                             |
| outputPorts[].tags                         | array  | Tags                      | No       | Tags.                                                                                                                                  |
| outputPorts[].customProperties             | array  | Custom properties         | No       | Custom properties.                                                                                                                     |
| outputPorts[].inputContracts               | array  | Input Contracts           | No       | Data contracts this output port depends on (its input dependencies).                                                                   |
| outputPorts[].inputContracts[].**id**      | string | Contract Id               | Yes      | Identifier of the referenced data contract.                                                                                            |
| outputPorts[].inputContracts[].**version** | string | Version                   | Yes      | Version of the referenced data contract.                                                                                               |
| outputPorts[].sbom                         | array  | SBOM                      | No       | Software Bill of Material.                                                                                                             |
| outputPorts[].sbom[].id                    | string | ID                        | No       | A unique identifier for the element used to create stable, refactor-safe references. Recommended for elements that will be referenced. |
| outputPorts[].sbom[].type                  | string | Type of SBOM              | No       | `external` is the default and only supported value.                                                                                    |
| outputPorts[].sbom[].url                   | string | URL                       | No       | URL to download the Software Bill of Materials.                                                                                        |
