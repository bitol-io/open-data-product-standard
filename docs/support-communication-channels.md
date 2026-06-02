---
title: "Support and Communication Channels"
description: "Support and communication channels for the data product."
---

<!--
Copyright 2026 The Bitol Contributors
SPDX-License-Identifier: Apache-2.0
-->

# Support and Communication Channels

The structure describing support and communication channels is shared between all Bitol standards and follows the [ODCS Support & Communication Channels structure](https://bitol-io.github.io/open-data-contract-standard/latest/support-communication-channels/).

[Back to TOC](README.md)

## Field Descriptions

| Key                                | Type   | UX label                  | Required | Description                                                                                                                            |
| ---------------------------------- | ------ | ------------------------- | -------- | -------------------------------------------------------------------------------------------------------------------------------------- |
| support                            | array  | Support                   | No       | Top level for support channels.                                                                                                        |
| support[].channel                  | string | Channel                   | Yes      | Channel name or identifier.                                                                                                            |
| support[].description              | string | Description               | No       | Description of the channel, free text.                                                                                                 |
| support[].id                       | string | ID                        | No       | A unique identifier for the element used to create stable, refactor-safe references. Recommended for elements that will be referenced. |
| support[].invitationUrl            | string | Invitation URL            | No       | Some tools uses invitation URL for requesting or subscribing. Follows the [URL scheme](https://en.wikipedia.org/wiki/URL#Syntax).      |
| support[].scope                    | string | Scope                     | No       | Scope can be: `interactive`, `announcements`, `issues`.                                                                                |
| support[].tool                     | string | Tool                      | No       | Name of the tool, value can be `email`, `slack`, `teams`, `discord`, `ticket`, or `other`.                                             |
| support[].url                      | string | Channel URL               | Yes      | Access URL using normal [URL scheme](https://en.wikipedia.org/wiki/URL#Syntax) (https, mailto, etc.).                                  |
| support[].authoritativeDefinitions | array  | Authoritative Definitions | No       | Authoritative definitions block.                                                                                                       |
| support[].tags                     | array  | Tags                      | No       | Tags as a list.                                                                                                                        |
| support[].customProperties         | array  | Custom Properties         | No       | Custom properties block.                                                                                                               |
