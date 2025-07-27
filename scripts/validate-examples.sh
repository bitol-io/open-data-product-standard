#!/usr/bin/env bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
LIGHT_BLUE='\033[1;34m'
NC='\033[0m'

script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
project_root=$(dirname "$script_dir")
json_schema_version=${JSON_SCHEMA_VERSION:-v0.9.0}
num_failed_validation=0

echo -e "${YELLOW}Open Data Product Standard (ODPS) Validation Script${NC}"
echo "=================================================="
echo ""

# Check if ajv is installed
if ! command -v ajv &> /dev/null; then
    echo -e "${RED}Error: ajv is required but not installed.${NC}"
    echo "Please install ajv: npm install -g ajv-cli"
    exit 1
fi

echo -e "${GREEN}✓ AJV found: $(which ajv)${NC}"

# Check if schema file exists
schema_file="${project_root}/schema/odps-json-schema-${json_schema_version}.json"
if [ ! -f "$schema_file" ]; then
    echo -e "${RED}Error: Schema file not found at $schema_file${NC}"
    exit 1
fi

echo -e "${GREEN}✓ Schema file found: $schema_file${NC}"

echo "Checking if $json_schema_version JSON schema is valid"
if ajv compile --spec=draft2019 -c ajv-formats -s "$schema_file"; then
    echo -e "${GREEN}Valid JSON schema${NC}"
else
    echo -e "${RED}Invalid JSON schema, exiting${NC}"
    exit 1
fi

echo ""
echo -e "${YELLOW}Validating example ODPS files based on ${json_schema_version} JSON schema${NC}"

# Check if examples directory exists
examples_dir="${project_root}/docs/examples"
if [ ! -d "$examples_dir" ]; then
    echo -e "${YELLOW}Warning: Examples directory not found at $examples_dir${NC}"
    echo "Creating examples directory..."
    mkdir -p "$examples_dir"
    echo -e "${YELLOW}No YAML files found in examples directory${NC}"
    exit 0
fi

# Find all YAML files in examples directory
yaml_files=$(find "$examples_dir" -name "*.yaml" -o -name "*.yml" 2>/dev/null || true)

if [ -z "$yaml_files" ]; then
    echo -e "${YELLOW}No YAML files found in examples directory${NC}"
    exit 0
fi

echo -e "${YELLOW}Found YAML files to validate:${NC}"
echo "$yaml_files" | while read -r file; do
    echo "  - $(basename "$file")"
done
echo ""

# Validate each YAML file
for file in $yaml_files; do
    if ajv validate --spec=draft2019 --all-errors -c ajv-formats -s "$schema_file" -d "$file"; then
        echo -e "${GREEN}Passed validation, file=$(basename "$file")${NC}"
    else
        echo -e "${RED}Failed validation, file=$(basename "$file")${NC}"
        num_failed_validation=$((num_failed_validation+1))
    fi
done

echo ""
echo "=================================================="
echo -e "${YELLOW}Validation Summary:${NC}"
echo -e "${YELLOW}Total failed=${num_failed_validation}${NC}"

if [ "${num_failed_validation}" -gt 0 ]; then
    echo -e "${RED}✗ Some files failed validation${NC}"
    exit 1
else
    echo -e "${GREEN}✓ All files are valid!${NC}"
    exit 0
fi 