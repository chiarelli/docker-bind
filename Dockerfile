FROM ubuntu:16.04

USER root

RUN apt-get update && apt-get upgrade -y
RUN apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
RUN echo "deb http://apt.dockerproject.org/repo ubuntu-xenial main" >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

RUN apt-get install docker-engine  -y
RUN apt install openssh-server -y
RUN apt autoclean -y && apt clean -y

COPY ssh_config /etc/ssh/sshd_config
COPY start.sh /
RUN chmod 0764 -R start.sh

CMD /start.sh
