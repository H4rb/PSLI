#!/bin/bash

old_process="$(ps -eo user,command)"

while true; do

  new_process="$(ps -eo user,command)"
  diff <(echo "$old_process") <(echo "$new_process") | grep "[\>\<]" | grep -vE "PSLI.sh|command|kworker"
  old_process="$new_process"

done
