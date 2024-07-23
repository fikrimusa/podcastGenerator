FROM ubuntu:22.04

# Install required packages and dependencies
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    python3-venv \
    git \
    build-essential

# Create a virtual environment and activate it
RUN python3 -m venv /opt/venv

# Upgrade pip and install PyYAML within the virtual environment
RUN /opt/venv/bin/pip install --upgrade pip && /opt/venv/bin/pip install PyYAML

# Copy your script and entrypoint
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Set the entrypoint
ENTRYPOINT ["/entrypoint.sh"]

# Set the PATH environment variable to use the virtual environment's pip and python
ENV PATH="/opt/venv/bin:$PATH"