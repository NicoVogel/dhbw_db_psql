# Demo implementation NodeJS and PostgreSQL

The demo starts a **NodeJS** server which connects to a **PostgreSQL** database. All scripts in the `./sql` folder are executed on startup. The file `./sql/test_data.sql` contains randomly generated data. The node server is located in `./node`. This Demo was part of a database course and some further documentation was part of the task. These documents are in the `./document` folder, but its written in German.

## Requirements

Your need **docker** and **docker-compose** to start the demo.

## Getting started

Use the following commands to clone and start the demo.

```bash
git clone https://github.com/NicoVogel/dhbw_db_psql
cd dhbw_db_psql
docker-compose up
```

## Problems

If the views do not load, please restart the docker containers.

```bash
docker-compose stop
docker-compose up
```
