---
title: "Synonyms"
description: "Alternative names for a data product or output port."
---

<!--
Copyright 2026 The Bitol Contributors
SPDX-License-Identifier: Apache-2.0
-->

# Synonyms

Synonyms are alternative names for a named object, helping catalogs, AI/LLM tools, and natural language interfaces resolve business vocabulary to the underlying object. The structure is shared between all Bitol standards and follows the [ODCS Synonyms structure](https://bitol-io.github.io/open-data-contract-standard/latest/schema/#synonyms). In ODPS, `synonyms` is allowed on the data product itself and on output ports; tools MUST NOT accept it at other locations. Introduced in v1.1.0 ([RFC 0041](https://github.com/bitol-io/tsc/blob/main/rfcs/approved/odps-v1.1.0/0041-synonyms.md)).

[Back to TOC](README.md)

## Example

```yaml
synonyms:
  - synonym: Customer 360
  - synonym: Golden customer record
    source: data-governance
  - id: client-fr
    synonym: Référentiel client
    locale: fr-FR
    description: French name used by EU subsidiaries.
  - synonym: MDM customer feed
    status: deprecated
```

## Field Descriptions

| Key                       | Type   | UX label          | Required | Description                                                                                                                            |
| ------------------------- | ------ | ----------------- | -------- | -------------------------------------------------------------------------------------------------------------------------------------- |
| synonyms                  | array  | Synonyms          | No       | A list of alternative names for the object.                                                                                            |
| synonyms[].description    | string | Description       | No       | Short human-readable note about when or why this synonym is used.                                                                      |
| synonyms[].id             | string | ID                | No       | A unique identifier for the synonym, useful when referencing or deduplicating synonyms across tools. Recommended for elements that will be referenced. |
| synonyms[].locale         | string | Locale            | No       | [BCP 47](https://datatracker.ietf.org/doc/html/rfc5646) language tag (e.g., `en-US`, `fr-FR`) when the synonym is language-specific.    |
| synonyms[].source         | string | Source            | No       | Origin of the synonym (e.g., `glossary`, `finance-team`, `legacy-system`).                                                             |
| synonyms[].status         | string | Status            | No       | Lifecycle status of the synonym (e.g., `active`, `deprecated`).                                                                        |
| synonyms[].**synonym**    | string | Synonym           | Yes      | The synonymous term.                                                                                                                   |
| synonyms[].customProperties | array | Custom Properties | No       | Custom properties block.                                                                                                              |

[Back to TOC](README.md)
