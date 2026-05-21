---
title: "Team"
description: "The team responsible for the data product."
---

# Team

The structure describing the team is shared between all Bitol standards and follows the [ODCS Team structure](https://bitol-io.github.io/open-data-contract-standard/latest/team/), matching RFC 0016.

[Back to TOC](README.md)

## Field Descriptions

| Key                                     | Type   | UX label                  | Required | Description                                                                                                                            |
| --------------------------------------- | ------ | ------------------------- | -------- | -------------------------------------------------------------------------------------------------------------------------------------- |
| team                                    | object | Team                      | No       | Object representing a team.                                                                                                            |
| team.description                        | string | Description               | No       | Team description.                                                                                                                      |
| team.name                               | string | Name                      | No       | Team name.                                                                                                                             |
| team.authoritativeDefinitions           | array  | Authoritative Definitions | No       | Authoritative definitions block.                                                                                                       |
| team.tags                               | array  | Tags                      | No       | Tags as a list.                                                                                                                        |
| team.customProperties                   | array  | Custom Properties         | No       | Custom properties block.                                                                                                               |
| team.members                            | array  | Team Members              | No       | List of members                                                                                                                        |
| team.members[].dateIn                   | string | Date In                   | No       | The date when the user joined the team.                                                                                                |
| team.members[].dateOut                  | string | Date Out                  | No       | The date when the user ceased to be part of the team.                                                                                  |
| team.members[].description              | string | Description               | No       | The user's name.                                                                                                                       |
| team.members[].id                       | string | ID                        | No       | A unique identifier for the element used to create stable, refactor-safe references. Recommended for elements that will be referenced. |
| team.members[].name                     | string | Name                      | No       | The user's name.                                                                                                                       |
| team.members[].replacedByUsername       | string | Replaced By Username      | No       | The username of the user who replaced the previous user.                                                                               |
| team.members[].role                     | string | Role                      | No       | The user's job role; Examples might be owner, data steward. There is no limit on the role.                                             |
| team.members[].**username**             | string | Username                  | Yes      | The user's username or email.                                                                                                          |
| team.members[].authoritativeDefinitions | array  | Authoritative Definitions | No       | Authoritative definitions block.                                                                                                       |
| team.members[].tags                     | array  | Tags                      | No       | Tags as a list.                                                                                                                        |
| team.members[].customProperties         | array  | Custom Properties         | No       | Custom properties block.                                                                                                               |
