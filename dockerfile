# Use a fixed version of Ubuntu as the base image
FROM ubuntu:20.04

# Set environment variable to avoid interactive dialogs during package installation
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y sudo


ADD ./ ./

RUN chmod +x ./install_ansible_ubuntu.sh && ./install_ansible_ubuntu.sh

CMD ["bash"]
