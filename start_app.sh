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
  COUNT=${1:-10}
#  echo "$COUNT"
  while (( COUNT > 0 )) ; do
    echo -e "$COUNT \c"
    (( COUNT-- ))
    sleep 1
  done
  echo
}


echo "Doing Stuff..." >> ${LOG}
countDown 10

echo "Done."
