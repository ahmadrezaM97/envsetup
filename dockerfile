# Use a fixed version of Ubuntu as the base image
FROM ubuntu:latest

# Set environment variables and install required packages
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=UTC

RUN apt-get update && apt-get install -y \
    sudo \
    passwd \
    adduser \
    && rm -rf /var/lib/apt/lists/* \
    && useradd -ms /bin/bash ahmad \
    && echo "ahmad:changeme123" | chpasswd \
    && adduser ahmad sudo

# Copy the installation script
COPY install_ansible_ubuntu.sh /install_ansible_ubuntu.sh

# Make the script executable and run it
RUN chmod +x /install_ansible_ubuntu.sh && \
    ./install_ansible_ubuntu.sh

# Copy the rest of your application files
ADD ./src ./src

# Default command to run bash
CMD ["bash"]
