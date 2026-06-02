---
title: "Custom & Other Properties"
description: "Custom properties and other properties of the data product."
---

<!--
Copyright 2026 The Bitol Contributors
SPDX-License-Identifier: Apache-2.0
-->

# Custom & Other Properties

This section covers custom properties and other properties you may find in a data product.

[Back to TOC](README.md)

## Custom Properties

The structure describing custom properties is shared between all Bitol standards and follows the [ODCS Custom & Other Properties structure](https://bitol-io.github.io/open-data-contract-standard/latest/custom-other-properties/).

| Key                             | Type   | UX label          | Required | Description                                                                                                                            |
| ------------------------------- | ------ | ----------------- | -------- | -------------------------------------------------------------------------------------------------------------------------------------- |
| customProperties                | array  | Custom Properties | No       | A list of key/value pairs for custom properties.                                                                                       |
| customProperties[].description  | string | Description       | No       | Optional description.                                                                                                                  |
| customProperties[].id           | string | ID                | No       | A unique identifier for the element used to create stable, refactor-safe references. Recommended for elements that will be referenced. |
| customProperties[].**property** | string | Property          | No       | The name of the key. Names should be in camel case–the same as if they were permanent properties in the contract.                      |
| customProperties[].value        | any    | Value             | No       | The value of the key.                                                                                                                  |

## Other Properties

| Key              | Type   | UX label            | Required | Description                                                            |
| ---------------- | ------ | ------------------- | -------- | ---------------------------------------------------------------------- |
| productCreatedTs | string | Product Created UTC | No       | Timestamp in UTC of when the data product was created, using ISO 8601. |
