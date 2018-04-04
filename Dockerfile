# Uses Circle's latest Node image as the base
FROM circleci/node:latest

# Environment variables
ENV NPM_CONFIG_PREFIX=/home/node/.npm-global
ENV PATH="/home/node/.npm-global:${PATH}"

# Update aptitude
RUN sudo apt-get update && \
    sudo apt-get -y upgrade

# Install Python, pip, and Docker
RUN sudo apt-get install -y \
        python \
        python-pip \
        python-dev \
        docker

# Install AWS CLI
RUN sudo pip install --upgrade awscli

# Install AWS SAM
USER node
RUN npm install -g aws-sam-local

# Test
RUN aws --version
#RUN sam --version