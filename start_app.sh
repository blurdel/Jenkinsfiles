#!/bin/bash

LOG="application.log"
rm -f ${LOG}

me=$(basename $0)
echo "me=${me} $@"

if [ $# -ne 1 ]; then
  echo "usage: $0 <file=filename.csv>"
  exit
fi

function countDown {
  local COUNT=${1:-10}
  while (( COUNT > 0 )) ; do
    echo -e "$COUNT \c"
    (( COUNT-- ))
    sleep 1
  done
  echo # Add a newline
}


echo "Doing Stuff..."
countDown 10

echo "Done."
