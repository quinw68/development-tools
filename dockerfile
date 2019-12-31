FROM alpine:3.10

ENV NPM_CONFIG_PREFIX=/home/node/.npm-global

RUN adduser -D -g '' node
RUN apk add --no-cache --virtual .build-deps \
        curl 

RUN apk update
RUN apk add --update git nodejs npm

# Create the g
RUN mkdir /home/node/dev
RUN chown -R node:node /home/node/dev
USER node
RUN git config --global user.name "Quinton Williams"
RUN git config --global user.email "quinw68@gmail.com"

VOLUME /home/node/dev
WORKDIR /home/node/dev

ENV PATH /home/node/.npm-global/bin:$PATH
RUN npm install -g typescript ts-node serverless
