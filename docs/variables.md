---
title: "Variables"
description: "Variable interpolation in ODPS: keep secrets and environment-specific values out of the data product with ${VAR_NAME} references resolved at runtime by tooling."
---

<!--
Copyright 2026 The Bitol Contributors
SPDX-License-Identifier: Apache-2.0
-->

# Variables

Any string value in a data product MAY contain one or more variable references of the form `${VAR_NAME}`, resolved at runtime by tooling. The mechanism is shared between all Bitol standards ([RFC 0050](https://github.com/bitol-io/tsc/blob/main/rfcs/approved/odps-v1.1.0/0050-variables.md), shared with ODCS and OORS). It keeps secrets and environment-specific values — hostnames, bucket paths, credentials — out of the document itself, so the same data product definition works across environments and is safe to store in version control. Introduced in v1.1.0.

References MAY appear as a whole value or as a substring. A reference MAY carry an inline default using the POSIX `${VAR_NAME:-default}` form: the text between `:-` and the closing `}` is used verbatim when the variable is unset or empty.

`VAR_NAME` is an identifier chosen by the author. Resolution is intentionally left to tooling; common sources include OS environment variables, `.env` files, secret managers, and CI/CD pipeline variables.

[Back to TOC](README.md)

## Example

```yaml
tenant: ${TENANT:-RetailCorp}

description:
  purpose: Orders data for ${TARGET_ENVIRONMENT:-prod} consumers.

customProperties:
  - property: dataLakePath
    value: s3://${DATA_BUCKET}/orders/
```

## Syntax

| Form                    | Behavior when the variable is set | Behavior when the variable is unset or empty |
|-------------------------|-----------------------------------|----------------------------------------------|
| `${VAR_NAME}`           | Replaced by the variable's value. | Tooling SHOULD surface an error; it MUST NOT silently substitute an empty string. |
| `${VAR_NAME:-default}`  | Replaced by the variable's value. | Replaced by `default`, verbatim.             |

## Tooling behavior

* Tools MUST resolve `${VAR_NAME}` references before using the value for any purpose.
* If a referenced variable cannot be resolved (and no default is supplied), tools SHOULD surface an error and MUST NOT silently substitute an empty string.
* Tools MUST preserve unresolved `${VAR_NAME}` and `${VAR_NAME:-default}` tokens verbatim when serializing a data product back to YAML (round-trip safety).
* Tools MAY define their own resolution order across sources (for example, OS environment variable before `.env` file).

## Notes

* Interpolation applies to **string** values only: a field typed as an integer or boolean in the JSON schema cannot hold a variable reference, as the unresolved token is a string and the schema rejects it.
* No new section or field is added to the standard: a data product using variables validates against the standard JSON schema as-is.

[Back to TOC](README.md)
