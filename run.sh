docker run -t -d --cap-add=NET_ADMIN --network=host \
        --restart=always --name=ss-server --privileged \
        -e LOCAL_PORT=8388 -e PASSWD=test -e ENCRYPT_METHOD=aes-256-cfb \
        ssserver 
