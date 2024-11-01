# use the latest Nginx / Debian image as the base
FROM nginx:latest

# customizations
COPY ./docker-build/index.html /usr/share/nginx/html/
COPY ./docker-build/.bashrc /root/

# apt update, upgrade and install required packages
RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y procps lsof iputils-ping telnet dnsutils iproute2 \
    netcat-openbsd socat && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Avoid starting nginx service
# CMD ["sleep", "infinity"]
