#!/bin/bash
INPUT_DIR=$1

for file in "$INPUT_DIR"/*.json
do
  filename=$(basename "$file" .json)
  jq -r -f filter.jq "$file" > "csv_data/${filename}.csv"
done
