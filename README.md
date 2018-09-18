# This project is from a DHBW Stuttgart Student for the database course

the code can be executed directly by using the following **dockerfile** and **docker-compose.yml**.

# Dockerfile

````docker
FROM node:latest

RUN npm install npm@latest -g --quiet \
 && npm install nodemon -g --quiet
````

# docker-compose.yml

````docker
version: '3'
services:
  node:
    build: .
    ports:
    - "3000:3000"
    volumes:
    - .:/node
    command: >
      bash -c "rm -rf dhbw_db_psql \
        && git clone https://github.com/NicoVogel/dhbw_db_psql.git \
        && cd dhbw_db_psql \
        && ls \
        && npm install \
        && nodemon app.js"
  psql:
    image: postgres:10
    ports:
    - "5432:5432"
    volumes:
    - .:/psql
    links:
    - node
    environment:
    - POSTGRES_PASSWORD=admin
    - POSTGRES_USER=admin
````
