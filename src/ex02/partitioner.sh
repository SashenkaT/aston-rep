#!/bin/bash

for file in $1/*.csv; do
  ticker=$(basename "$file" .csv)
  
  mkdir -p "partitions/$ticker"
  echo "trade_date,open_price,low_price,high_price,close_price,volume" > "partitions/$ticker/header.csv"

  while read -r line; do
    clean_line=$(echo "$line" | tr -d '"')
    month=$(echo "$clean_line" | cut -d '-' -f 1,2)
    
    mkdir -p "partitions/$ticker/$month"
    echo "$line" >> "partitions/$ticker/$month/data.csv"
  done < "$file"
done
