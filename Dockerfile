# Use the latest Nginx / Debian image as the base
FROM nginx:latest

# Update the package list and install the required packages
RUN apt-get update && \
    apt-get install -y iputils-ping netcat-openbsd telnet dnsutils iproute2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Avoid starting nginx service
# CMD ["sleep", "infinity"]
