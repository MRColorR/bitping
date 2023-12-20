# Use an updated small linux image as a base
FROM debian:stable-slim

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive \
    PATH="/root/.local/bin:${PATH}" \
    NODE_DB_PATH="/root/.bitpingd/node.db" \
    BITPING_EMAIL="" \
    BITPING_PASSWD=""

# Install necessary packages
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -qqy \
    bash \
    tini \
    supervisor \
    curl \
    wget \
    unzip \
    expect \
    && rm -rf /var/lib/apt/lists/* \
    apt-get autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/install.deb

# Set up working directory
WORKDIR /app

# Copy entrypoint script and configuration files
COPY entrypoint.sh /entrypoint.sh
COPY supervisord.conf /etc/supervisord.conf

# Make scripts executable
RUN chmod +x /entrypoint.sh

# Download and install bitpingd
RUN curl https://bitping.com/install.sh | bash
# RUN source ~/.bashrc

# Set tini as the entrypoint and the custom script as the command
ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ["/entrypoint.sh"]

