#! /bin/bash
for VARIABLE in LOCAL_PORT ENCRYPT_METHOD PASSWD;
do
  if [[ -z "${!VARIABLE}" ]]; then
    echo Error: $VARIABLE is not defined, please check your docker-compose.yml
    exit
  fi
done
ss-server -s 0.0.0.0 -p $LOCAL_PORT -m $ENCRYPT_METHOD -k $PASSWD -t 300 --fast-open
