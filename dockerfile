FROM node:12

RUN apt install git

RUN npm install -g typescript ts-node serverless
VOLUME /home/node
WORKDIR /home/node