#!/bin/bash
for ticker in "$@"
do
  curl -s "https://iss.moex.com/iss/history/engines/stock/markets/shares/boards/TQBR/securities/${ticker}.json" -o "raw_data/${ticker}.json"
done
