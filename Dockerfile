FROM centos:7 
MAINTAINER jasonlin

RUN yum update -y && \
    yum install -y tar cmake net-tools clang nss-devel libcanberra-gtk3.x86_64 which && \
    yum group install -y "Development Tools" && \
    yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \
    yum install -y nodejs npm git && \
    yum clean all -y && rm -fr /var/tmp/*

RUN groupadd -g 1000 eleven && \
    useradd  -u 1000 -g 1000 -m -d /data eleven && \
    mkdir /usr/local/node_modules && \
    chown -R eleven.eleven /usr/local/node_modules

# geth
COPY ./geth*.tar.gz /usr/local/
RUN tar --strip-components=1 -xf /usr/local/geth*.gz -C /usr/bin && rm -f /usr/local/geth*tar.gz

USER eleven

RUN cd /usr/local/ && \
    npm config set prefix=/usr/local/node_modules && \
    npm install -g npm && \
    npm install -g n

COPY ./nodejs.sh /etc/profile.d/

RUN /bin/bash -l -c "n 8.6.0"
RUN mkdir -p /data/11be/dapps && cd /data/11be

COPY ./package.json /data/11be
RUN cd /data/11be && npm install 
COPY ./.local /data/11be/.local

# Define working directory.
WORKDIR /data/11be

EXPOSE 4001
EXPOSE 8081
EXPOSE 4002/udp
EXPOSE 30303
EXPOSE 30303/udp
EXPOSE 30304/udp

USER root

COPY ./start.sh /usr/bin/
RUN chmod +x /usr/bin/start.sh

USER eleven

ENTRYPOINT ["/usr/bin/start.sh"]
