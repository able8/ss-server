# ss-server
ss-server is a Docker image of shadowsocks server with version 2.4.6, built on x86 64-bits.

### How to run? 

#### Option 1 
Use the default parameters: `LOCAL_PORT=8388`, `PASSWD=test`, `ENCRYPT_METHOD=aes-256-cfb`
```
docker-compose up -d
```
#### Option 2
Use the customized parameters: 
```
docker-compose run -e LOCAL_PORT=8387 -e PASSWD=wheretogo
```
