echo "Starting Setup Script"
echo "---------------------"
echo "Setting Up Logging"
echo "---------------------"
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
FILES_DIR=${SCRIPT_DIR}/setup_files
echo "Installing files from:"
echo $FILES_DIR
echo "---------------------"
sudo apt-get install rsyslog logrotate -y

sudo install -d -m 755 -o root -g adm /var/log/containers

sudo cp $FILES_DIR/syslog.conf /etc/rsyslog.d/40-docker.conf
sudo systemctl restart rsyslog

sudo cp $FILES_DIR/logrotate /etc/logrotate.d/docker
sudo mkdir -p /etc/cron.hourly
sudo mv /etc/cron.daily/logrotate /etc/cron.hourly/logrotate

echo "---------------------"
echo "Setup Script Complete"
echo "---------------------"

sleep 3
