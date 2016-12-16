echo "Starting InfluxDB..."
influxd &
sleep 4
echo "InfluxDB has started."
echo "Creating initial database..."
influx --execute 'CREATE DATABASE dionysus_readings'
echo "Initial database has been created."
tail -f /var/log/dmesg
