---
title: "Authoritative Definitions"
description: "Reference external sources of truth from a data product."
---

# Authoritative Definitions

Authoritative Definitions are an essential part of the data product. They allow to delegate the definition or authority to a third-party system like an enterprise catalog, repository, etc. The structure describing authoritative definitions is shared between all Bitol standards and follows the [ODCS Authoritative Definitions structure](https://bitol-io.github.io/open-data-contract-standard/latest/authoritative-definitions/). This block is available in many sections.

[Back to TOC](README.md)

## Example

```yaml
authoritativeDefinitions:
  - url: https://catalog.data.gov/dataset/air-quality
    type: businessDefinition
    description: Business definition for the dataset.
  - id: vid-001
    url: https://www.youtube.com/watch?v=Iq6SxdsIHHE
    type: videoTutorial
    description: Discover what a data product is.
  - url: https://example.com/glossary/customer
    type: glossary
    description: Glossary entry backing the customer concept.
  - url: https://github.com/bitol-io/open-data-product-standard/blob/main/docs/examples/customer-data-product.odps.yaml
    type: canonicalUrl
    description: Data product's latest version.
```

## Field Descriptions

| Key                                    | Type   | UX label          | Required | Description                                                                                                                            |
| -------------------------------------- | ------ | ----------------- | -------- | -------------------------------------------------------------------------------------------------------------------------------------- |
| authoritativeDefinitions               | array  | Link              | No       | A list of type/link pairs for authoritative definitions.                                                                               |
| authoritativeDefinitions[].description | string | Description       | No       | Optional description.                                                                                                                  |
| authoritativeDefinitions[].id          | string | ID                | No       | A unique identifier for the element used to create stable, refactor-safe references. Recommended for elements that will be referenced. |
| authoritativeDefinitions[].**type**    | string | Definition type   | Yes      | Type of definition for authority. See the recommended values below.                                                                    |
| authoritativeDefinitions[].url         | string | URL to definition | Yes      | URL to the authority.                                                                                                                  |

## Recommended values for `type`

The `type` field is open (any string is technically valid), but the following values are recommended for interoperability across tools. Values are sorted alphabetically.

| Value                          | Where allowed | Description                                                                                                                               |
| ------------------------------ | ------------- | ----------------------------------------------------------------------------------------------------------------------------------------- |
| `businessDefinition`           | Any section   | Link to a business glossary entry, ontology, or other source describing the business meaning of the element.                              |
| `canonicalUrl`                 | Root only     | At the root level of a data product, marks a reference to the canonical/latest version of the data product itself (e.g., its source URL). |
| `glossary`                     | Any section   | Link to a business glossary entry defining the term or concept (RFC-0038).                                                                |
| `implementation`               | Any section   | Link to a code-level implementation, library, or reference that fulfils or interprets the element.                                        |
| `ontology`                     | Any section   | Link to an ontology describing the concept and its relationships (RFC-0038).                                                              |
| `taxonomy`                     | Any section   | Link to a taxonomy classifying the element (RFC-0038).                                                                                    |
| `transformationImplementation` | Any section   | Link to the implementation that produces the data (e.g., a dbt model, Spark job, SQL view definition, or pipeline reference).             |
| `tutorial`                     | Any section   | Link to a written tutorial, walkthrough, or how-to guide.                                                                                 |
| `videoTutorial`                | Any section   | Link to a recorded video that explains the element or how to use it.                                                                      |

Custom `type` values are allowed; tooling that does not recognise a custom value should treat the entry as an opaque link with a description.

[Back to TOC](README.md)
