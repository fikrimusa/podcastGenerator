FROM ubuntu:latest

# Install required packages and dependencies
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    git \
    build-essential

# Upgrade pip to the latest version
RUN pip3 install --upgrade pip

# Install PyYAML with verbose output
RUN pip3 install --verbose PyYAML

# Copy your script and entrypoint
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Set the entrypoint
ENTRYPOINT ["/entrypoint.sh"]