# ss-server
ss-server is a Docker image of shadowsocks server, built on x86 64-bits.

### Version

* 2.5.6
* 2.4.6


### Usage
 
```
docker run -t -d --cap-add=NET_ADMIN --network=host \
        --restart=always --name=ss-server --privileged \
        -e LOCAL_PORT=8388 -e PASSWD=test -e ENCRYPT_METHOD=aes-256-cfb -e TIMEOUT=600 \
        ssserver
```
