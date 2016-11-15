#! /bin/bash
if [ "$PASSWD" == "" ]; then
  ss-server -s 0.0.0.0 -p $LOCAL_PORT -t 300 --fast-open
else
  ss-server -s 0.0.0.0 -p $LOCAL_PORT -m $ENCRYPT_METHOD -k $PASSWD -t 300 --fast-open
fi
