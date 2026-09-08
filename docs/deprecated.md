---
title: "Deprecated"
description: "Flag marking a data product or port as no longer recommended for use."
---

<!--
Copyright 2026 The Bitol Contributors
SPDX-License-Identifier: Apache-2.0
-->

# Deprecated

`deprecated` is an optional boolean that signals an element is no longer recommended for use. It defaults to `false` when not specified. The flag is shared across Bitol standards (see the [ODCS Deprecated structure](https://bitol-io.github.io/open-data-contract-standard/latest/schema/#deprecated)). In ODPS, `deprecated` is allowed on the data product itself and on its input ports, output ports, and management ports. Introduced in v1.1.0 ([RFC 0051](https://github.com/bitol-io/tsc/blob/main/rfcs/approved/odps-v1.1.0/0051-deprecated-flag.md)).

Deprecated elements remain documented and validated for backward compatibility; implementations MAY warn when they are used. Use the `description` field to point to a replacement and provide migration guidance.

[Back to TOC](README.md)

## Example

```yaml
apiVersion: v1.1.0
kind: DataProduct
id: 064c4630-8aad-4dc0-ba95-0f69940e6b18
name: customer-360
status: active
outputPorts:
  - name: legacy-export
    type: file
    deprecated: true
    description: "DEPRECATED: use the 'tables' output port instead. Will be removed in the next major version."
  - name: tables
    type: tables
inputPorts:
  - name: legacy-source
    deprecated: true
```

## Field Descriptions

| Key          | Type    | UX label   | Required | Description                                                                                          |
| ------------ | ------- | ---------- | -------- | ---------------------------------------------------------------------------------------------------- |
| deprecated   | boolean | Deprecated | No       | Indicates the element is deprecated and should not be used in new implementations. Defaults to `false`. |

[Back to TOC](README.md)
