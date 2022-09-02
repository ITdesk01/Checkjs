FROM ubuntu:18.04
ENV MYPATH /usr/share/tg
WORKDIR $MYPATH
RUN apt update -y
RUN apt install python3 python3-pip wget inetutils-ping net-tools curl -y
RUN pip3 install telethon

ENV LC_ALL C.UTF-8
CMD cd $MYPATH
CMD /bin/bash


