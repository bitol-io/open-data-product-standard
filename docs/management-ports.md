---
title: "Management Ports"
description: "Access points for managing the data product."
---

# Management Ports

The management ports define access points for managing the data product.

[Back to TOC](README.md)

## Example

```yaml
managementPorts: 
- content: dictionary
  type: topic
  name: tpc-dict-update
  description: Kafka topic for dictionary updates
```

## Field Descriptions

| Key                                        | Type   | UX label                  | Required | Description                                                                                                                            |
| ------------------------------------------ | ------ | ------------------------- | -------- | -------------------------------------------------------------------------------------------------------------------------------------- |
| managementPorts                            | array  | Management Interface      | No       | Object defining a management port.                                                                                                     |
| managementPorts[].channel                  | string | Channel                   | No       | Channel to communicate with the data product.                                                                                          |
| managementPorts[].content                  | string | Content                   | Yes      | Content: can be `discoverability`, `observability`, or `control`.                                                                      |
| managementPorts[].description              | string | Description               | No       | Purpose and usage                                                                                                                      |
| managementPorts[].id                       | string | ID                        | No       | A unique identifier for the element used to create stable, refactor-safe references. Recommended for elements that will be referenced. |
| managementPorts[].**name**                 | string | Name                      | Yes      | Endpoint identifier or unique name.                                                                                                    |
| managementPorts[].type                     | string | Type                      | No       | Type: can be `rest` or `topic`. Default is `rest`.                                                                                     |
| managementPorts[].url                      | string | URL                       | No       | URL to access the endpoint.                                                                                                            |
| managementPorts[].authoritativeDefinitions | array  | Authoritative Definitions | No       | Authoritative definitions block.                                                                                                       |
| managementPorts[].tags                     | array  | Tags                      | No       | Tags.                                                                                                                                  |
| managementPorts[].customProperties         | array  | Custom Properties         | No       | Custom properties block.                                                                                                               |
