#!/bin/sh

if [ "${UNIX_PASSWD}" ]; then
    > /dev/null
else
   UNIX_PASSWD=$(tr -cd '[:alnum:]' < /dev/urandom | fold -w30 | head -n1)
   echo "\n" &&
   echo "**************************************************************\n" &&
   echo "Password for root (generated randomly): ${UNIX_PASSWD}\n" &&
   echo "**************************************************************\n\n"
fi

echo "root:${UNIX_PASSWD}"|chpasswd

/etc/init.d/ssh stop > /dev/null
/etc/init.d/ssh start

docker info

while true; do
    bash
done
