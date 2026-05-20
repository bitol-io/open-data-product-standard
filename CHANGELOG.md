---
title: "Changelog: Open Data Product Standard (ODPS)"
description: "Home of Open Data Product Standard (ODPS) documentation."
image: "https://raw.githubusercontent.com/bitol-io/artwork/main/horizontal/color/Bitol_Logo_color.svg"
---

This document tracks the history and evolution of the **Open Data Product Standard**.

# v1.1.0 - DRAFT

* Add optional top-level `type` field categorising data products by architectural alignment (e.g., `sourceAligned`, `aggregate`, `consumerAligned`) — RFC-0029.
* Add optional `context` block at the data product and output port levels for AI / semantic interoperability (instructions, verifiedStatements, constraints) — RFC-0038, shared with ODCS v3.2.0.
* Every object inside an array now carries an optional `id` for stable, refactor-safe references — aligned with ODCS.
* `inputPorts` and `outputPorts` now require only `name`; `version` and `contractId` are optional, and `sbom` no longer requires `url`.
* Documentation: modernize the full customer example to v1.1.0, including `type` and `context` (#15).
* Documentation: split the standard into one page per section; document `outputPorts[].inputContracts`; cross-link the shared sections (team, support, custom & other properties, authoritative definitions) to their ODCS definitions.

# v1.0.0 - 2025-09-24 - APPROVED

* Add `customProperties`, `tags` and `authoritativeDefinitions` for `outputPorts`, `inputPorts` (top level).
* Team structure aligned on ODCS v3.1.0.
* AuthoritativeDefinitions `type` changed from enum to examples, aligned with ODCS v3.1.0.
* Add keys in documentation where it makes sense.

# v0.9.0 - 2025-07-15 - DEPRECATED

* Approved release as v0.9.0.

# v0.1.0 - 2023-09-01 - DEPRECATED

* Very early draft, part of the discussions of creating Bitol within the Linux Foundation.
