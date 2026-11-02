#!/bin/bash

mkdir -p with_columns

for file in $1/*.csv; do
  ticker=$(basename "$file" .csv | tr -dc 'A-Za-z')
  sector=$(grep "$ticker" ../ex00/sectors.txt | cut -d '|' -f 2 | tr -dc 'A-Za-z')
  
  echo "TICKER,SECTOR,$(head -n 1 "$file" | tr -d '\r\n')" > "with_columns/$ticker.csv"
  tail -n +2 "$file" | tr -d '\r' | sed "s/^/$ticker,$sector,/" >> "with_columns/$ticker.csv"
done
