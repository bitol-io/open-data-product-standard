# ODPS Validation Scripts

This directory contains validation scripts for the Open Data Product Standard (ODPS), following the exact pattern from the [Open Data Contract Standard (ODCS)](https://github.com/bitol-io/open-data-contract-standard) repository.

## Scripts

### `validate-examples.sh`

A bash script that validates YAML examples against the JSON schema using AJV (Another JSON Validator).

**Requirements:**

- `ajv` - Another JSON Validator (Node.js tool)

**Installation:**

```bash
npm install -g ajv-cli
```

**Usage:**

```bash
./scripts/validate-examples.sh
```

## Quick Start

1. **Install AJV**:

   ```bash
   npm install -g ajv-cli
   ```

2. **Run Validation**:
   ```bash
   ./scripts/validate-examples.sh
   ```

## What the Script Does

1. **Check AJV Installation**: Verifies that AJV is installed and available
2. **Validate Schema**: Compiles and validates the JSON schema itself
3. **Find YAML Examples**: Scans the `examples/` directory for `.yaml` and `.yml` files
4. **Validate Each File**: Uses AJV to validate each YAML file against the schema
5. **Report Results**: Shows validation status and detailed error messages

## Example Output

```
Open Data Product Standard (ODPS) Validation Script
==================================================

✓ AJV found: /usr/local/bin/ajv
✓ Schema file found: /path/to/schema/odps-json-schema-v0.9.0.json
Checking if v0.9.0 JSON schema is valid
Valid JSON schema

Validating example ODPS files based on v0.9.0 JSON schema
Found YAML files to validate:
  - customer-data-product.odps.yaml
  - simple-data-product.odps.yaml

Passed validation, file=customer-data-product.odps.yaml
Passed validation, file=simple-data-product.odps.yaml

==================================================
Validation Summary:
Total failed=0
✓ All files are valid!
```

## Error Handling

The script provides detailed error messages when validation fails:

- **Missing required fields**: Shows which required fields are missing
- **Invalid field values**: Shows the problematic value and expected format
- **Schema violations**: Shows the specific validation rule that was violated

## Adding New Examples

1. Create a new YAML file in the `examples/` directory
2. Follow the ODPS schema structure
3. Run the validation script to check your example
4. Fix any validation errors before committing

## Schema Validation

The script validates against the complete ODPS schema including:

- **Fundamentals**: apiVersion, kind, id, name, status, etc.
- **Product Information**: inputPorts, outputPorts
- **Management Ports**: management interfaces
- **Support Channels**: communication channels
- **Team Information**: team members and roles
- **Custom Properties**: extensible properties
- **Authoritative Definitions**: reference links

## Environment Variables

- `JSON_SCHEMA_VERSION`: Set to specify which schema version to use (default: v0.9.0)

## Troubleshooting

### Common Issues

1. **AJV not installed**: Install with `npm install -g ajv-cli`
2. **YAML Syntax Errors**: Check YAML indentation and syntax
3. **Schema Loading Issues**: Ensure schema file path is correct
4. **Permission Errors**: Make script executable with `chmod +x scripts/validate-examples.sh`

### Getting Help

- Check the error messages for specific validation failures
- Review the schema documentation in `docs/README.md`
- Ensure all required fields are present in your YAML files
- Follow the examples in the `examples/` directory
