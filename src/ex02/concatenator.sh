#!/bin/bash

mkdir -p rebuilt

for stock_dir in partitions/*; do
  ticker=$(basename "$stock_dir")
  cat "$stock_dir/header.csv" > "rebuilt/$ticker.csv"
  ls "$stock_dir" | grep -v "header.csv" | sort -r | while read month; do
    cat "$stock_dir/$month/data.csv" >> "rebuilt/$ticker.csv"
  done
done
