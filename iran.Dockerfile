FROM ubuntu:20.04
LABEL maintainer="Alireza Gharib <alirezagharib110@gmail.com>"

WORKDIR /root
RUN cd /root
#RUN apt install sudo
RUN apt-get update
RUN apt upgrade -y
RUN apt install wget iptables unzip wget tzdata gzip -y
RUN wget https://github.com/jpillora/chisel/releases/download/v1.9.1/chisel_1.9.1_linux_amd64.gz
RUN gzip -d chisel_1.9.1_linux_amd64.gz
RUN chmod +x ./chisel_1.9.1_linux_amd64

ENV CONFIG_PORT=70000
ENV EXP_PORT=80
ENV MODE=client
ENV DOMAIN=domain.ir
ENV LISTEN_PORT=8080
ENV TZ=Asia/Tehran
CMD /root/chisel_1.9.1_linux_amd64 $MODE  http://$DOMAIN:$LISTEN_PORT 0.0.0.0:$EXP_PORT:127.0.0.1:$CONFIG_PORT
