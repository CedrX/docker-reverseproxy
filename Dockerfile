FROM debian:latest

MAINTAINER Cedric TINTANET <cedric.tintanet@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm
ENV PATH=$PATH:/scripts
#ENV PROXY="http://172.17.0.1:3128"
ARG PROXY

# Create script directory
RUN mkdir -p /scripts/

# Copy scripts
COPY scripts/* /scripts/
RUN chmod +x /scripts/*
RUN /scripts/set_proxy.sh $PROXY
# Update repositories and install apache and nano
# After that apt status information
RUN apt-get update && \
    apt-get install -y apache2 \ 
    vim \
    lsof \ 
    net-tools \
    tcpdump \  
#    libapache2-mod-auth-cas \
    libapache2-mod-proxy-msrpc && \
    rm -rf /var/lib/apt/lists/*

# Set ServerName
RUN echo "ServerName localhost" >> /etc/apache2/conf-enabled/hostname.conf

# Enable mods
#RUN a2enmod ssl headers proxy proxy_http proxy_html xml2enc auth_cas  rewrite usertrack proxy_msrpc
RUN a2enmod ssl headers proxy proxy_http proxy_html xml2enc rewrite usertrack proxy_msrpc

# Create certificate directories
RUN mkdir -p /etc/ssl/apache/keys && \
    mkdir -p /etc/ssl/apache/certs && \
    mkdir -p /etc/ssl/apache/intermediates


#Create pid directory
RUN mkdir -p /var/run/apache2

# Set permissions
RUN chmod -R 700 /etc/ssl/apache


#CMD ["/usr/sbin/apache2ctl" , "-D", "FOREGROUND"]
CMD ["/scripts/start_apache.sh"]

EXPOSE 80 443
