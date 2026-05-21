---
title: "Context"
description: "AI and semantic context guidance for the data product."
---

# Context

Added in **ODPS v1.1.0** (RFC-0038). The `context` block provides structured, human- and machine-readable guidance for AI agents, LLMs, BI tools, and semantic layer platforms. It is optional and additive.

In ODPS, `context` is applicable at two levels:

- **Data product (top level)** — overall AI context for the product: which questions it can answer, which output port to use for what purpose.
- **Output port** — guidance on how to consume a specific port: access patterns, recommended query approach, format hints.

Input ports do not define their own `context`. AI agents consuming a data product should refer to the `context` defined on the ODCS data contract linked from the input port.

[Back to TOC](README.md)

## Example

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

## Field Descriptions

| Key                                                   | Type   | UX label                  | Required | Description                                                                                                                                                                                                          |
| ----------------------------------------------------- | ------ | ------------------------- | -------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| context.instructions                                  | string | Instructions              | No       | Natural language guidance for AI agents and tools on how to use this entity. Equivalent to a system prompt scoped to this level.                                                                                     |
| context.constraints                                   | array  | Constraints               | No       | Negative guidance: what AI agents must NOT do with this entity.                                                                                                                                                      |
| context.constraints[].**constraint**                  | string | Constraint                | Yes      | The constraint text (negative guidance for AI agents).                                                                                                                                                               |
| context.constraints[].id                              | string | ID                        | No       | Stable identifier for the constraint.                                                                                                                                                                                |
| context.constraints[].authoritativeDefinitions        | array  | Authoritative Definitions | No       | Links to policy, regulation, glossary, or other authoritative sources backing this constraint.                                                                                                                       |
| context.constraints[].tags                            | array  | Tags                      | No       | Free-form tags for filtering, grouping, or routing constraints.                                                                                                                                                      |
| context.constraints[].customProperties                | array  | Custom Properties         | No       | Custom properties.                                                                                                                                                                                                   |
| context.verifiedStatements                            | array  | Verified Statements       | No       | Canonical business questions, each with an optional curated answer. Entries with `answer` should be returned verbatim when a query is semantically close; entries without `answer` are sample questions for priming. |
| context.verifiedStatements[].answer                   | string | Answer                    | No       | The expected response or result description.                                                                                                                                                                         |
| context.verifiedStatements[].id                       | string | ID                        | No       | Stable identifier for the entry.                                                                                                                                                                                     |
| context.verifiedStatements[].**question**             | string | Question                  | Yes      | The canonical question.                                                                                                                                                                                              |
| context.verifiedStatements[].authoritativeDefinitions | array  | Authoritative Definitions | No       | Links to glossary, taxonomy, ontology, or other authoritative sources backing this entry.                                                                                                                            |
| context.verifiedStatements[].tags                     | array  | Tags                      | No       | Free-form tags for filtering, grouping, or routing entries.                                                                                                                                                          |
| context.verifiedStatements[].customProperties         | array  | Custom Properties         | No       | Custom properties.                                                                                                                                                                                                   |

For the full normative specification of cascading behavior between levels, see [RFC-0038](https://github.com/bitol-io/tsc/blob/main/rfcs/approved/odcs-v3.2.0/0038-context.md).
