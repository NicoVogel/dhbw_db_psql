# This project is from a DHBW Stuttgart student for the database course

This is a demo project which does start a **NodeJS** server which does show results from multiple **PostgreSQL** views.

The sql scripts are in the **sql** folder and the file *test_data.sql* contains test data which was randomly generated.

The node server is locaded in the **node** folder. The *docker-compose.yml* does execute a *npm install* so everything is automated.

To make things easyer **express** is also used.

## Requirements

Only the **docker** and **docker-compose** is needed to get the demo working.

## How do is start it?

1. clone the repository

````shell
git clone https://github.com/NicoVogel/dhbw_db_psql
````

2. open a shell and navigate into the *dhbw_db_psql* folder.

3. execude the command *(ubuntu with sudo)*:

````docker
docker-compose up
```` 