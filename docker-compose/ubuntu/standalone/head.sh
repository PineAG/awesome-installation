#!/bin/bash
mkdir /tmp/docker-standalone
PAYLOAD_LINE=`awk '/^__PAYLOAD_BELOW__/ {print NR + 1; exit 0; }' $0`
tail -n+$PAYLOAD_LINE $0 | tar xzv -C /tmp/docker-standalone

cd /tmp/docker-standalone/build/resources
./install-standalone.sh

rm -rf /tmp/docker-standalone
exit 0

__PAYLOAD_BELOW__
