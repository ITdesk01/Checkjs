FROM ubuntu:18.04
ENV MYPATH /usr/share/tg
WORKDIR $MYPATH
RUN apt update -y
RUN apt install python3.7 python3-pip wget inetutils-ping net-tools curl git -y
RUN python3.7 -m pip install Telethon

ENV LC_ALL C.UTF-8
CMD cd $MYPATH
CMD /bin/bash


