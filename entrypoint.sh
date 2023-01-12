#!/bin/sh

ok="-- ok --"
connection_failed="no such host|connection refused"

while true
do
  output=$(migrate $@ 2>&1 && echo $ok)

  echo $output | grep -- "$ok" && echo $ok && break

  echo $output | grep -q -E "$connection_failed" &&
    echo "$output" &&
    echo "-- connection failed, retry after 3s --" &&
    sleep 3 &&
    continue

  echo "$output"
  echo "-- operation failed --" &&

  break
done
