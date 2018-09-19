FROM node:latest

RUN npm install npm@latest -g --quiet \
 && npm install nodemon -g --quiet