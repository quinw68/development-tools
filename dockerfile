FROM ubuntu:18.04

ENV NVM_DIR /usr/local/nvm

# Create a non-root node user
RUN useradd -mrs /bin/bash node

# Install deps and allow node user to use NVM
RUN apt-get update
RUN apt-get -y install build-essential libssl-dev git curl vim
RUN mkdir $NVM_DIR
RUN chown node:node /usr/local/nvm

USER node
SHELL ["/bin/bash", "-c"]
RUN curl https://raw.githubusercontent.com/creationix/nvm/v0.35.2/install.sh | bash
RUN source ${NVM_DIR}/nvm.sh \
    && nvm install 12 \
    && npm install -g serverless typescript

# Make a copy of bashrc to be used by the home directory
# The home directory is where the user's VOLUME will be
RUN cp ~/.bashrc /tmp
VOLUME /home/node
WORKDIR /home/node

COPY init.sh /init.sh
ENTRYPOINT /init.sh && /bin/bash