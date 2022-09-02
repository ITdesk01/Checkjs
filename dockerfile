FROM ubuntu:18.04
ENV MYPATH /usr/share/tg
WORKDIR $MYPATH
RUN apt update -y
RUN apt install python3 python3-pip wget inetutils-ping net-tools curl -y
RUN pip3 install telethon

ENV LC_ALL C.UTF-8
CMD cd $MYPATH
CMD /bin/bash
CMD if [[ `curl -I -m 2 -s -w "%{http_code}\n" -o /dev/null   www.google.com` == "200" ]];then echo "你docker可以连接google，欢迎使用" ;else echo "你docker无法连接google";fi

