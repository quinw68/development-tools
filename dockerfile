FROM alpine:3.10

ENV NPM_CONFIG_PREFIX=/home/.npm-global

RUN adduser -D -g '' node
RUN apk add --no-cache --virtual .build-deps \
        curl 

RUN apk update
RUN apk add --update git nodejs npm

USER node
RUN git config --global user.name "Quinton Williams"
RUN git config --global user.email "quinw68@gmail.com"

VOLUME /home/node
WORKDIR /home/node

ENV PATH /home/.npm-global/bin:$PATH
RUN npm install -g typescript ts-node serverless
