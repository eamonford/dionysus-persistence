FROM resin/rpi-raspbian
FROM influxdb
RUN apt-get update && apt-get install -y sqlite3
COPY . /persistence
RUN mkdir /var/lib/dionysus
RUN sqlite3 /var/lib/dionysus/sensors.db < /persistence/0.1_create_initial_tables.sql
ENTRYPOINT influxd && influx --execute 'CREATE DATABASE dionysus_readings'
