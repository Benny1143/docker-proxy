FROM debian:stable-slim

RUN apt-get update && apt-get upgrade -y && apt-get install -y wget

RUN ["wget", "--no-check-certificate", "https://raw.githubusercontent.com/teddysun/shadowsocks_install/master/shadowsocksR.sh"]

RUN ["chmod", "+x", "shadowsocksR.sh"]

EXPOSE 443

RUN printf "password\n443\n12\n4\n3\n" | ./shadowsocksR.sh 2>&1 | tee shadowsoc$

COPY commands.sh /scripts/commands.sh

RUN ["chmod", "+x", "/scripts/commands.sh"]

ENTRYPOINT ["/scripts/commands.sh"]