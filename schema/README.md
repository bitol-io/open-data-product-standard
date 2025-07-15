# ODPS JSON Schema

You will find all the versions of the Open Data Product Standard (ODPS) JSON Schema files here. Each version will be 
stored here for reference and to allow [SchemaStore](https://github.com/SchemaStore/schemastore) to keep track of each
version.

If you want your files to be automatically detected as ODPS files, use the file extension `.odps.yaml`. For example,
`my-big-data.odps.yaml`.

## SchemaStore

SchemaStore is a widely adopted repository of JSON schema files for integration with tools such as Intellij and VS Code.
ODPS was onboarded to SchemaStore as part of [this pull request](https://github.com/SchemaStore/schemastore/pull/3868).

## Versioning

When a new version of ODPS JSON Schema is available, a pull request to SchemaStore should be created to update the 
following section:

```json
    {
      "name": "Open Data Product Standard (ODPS)",
      ...,
      "versions": {
        "<new_version>": "https://github.com/bitol-io/open-data-product-standard/blob/main/schema/odps-json-schema-<new_version>.json",
        ...
        "v0.9.0": "https://github.com/bitol-io/open-data-product-standard/blob/main/schema/odps-json-schema-v0.9.0.json"
      }
    },
```

And the `odcs-json-schema-latest.json` should be updated with the latest version changes.
