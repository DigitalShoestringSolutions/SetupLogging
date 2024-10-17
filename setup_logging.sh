# 8 space indentation on echo outputs
echo "        Setting Up Logging"

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

echo "        Installing files from:"    # SCRIPT_DIR is long so don't echo this as well on one line
echo -n "        "  # print 8 spaces without newline at end to indent below
echo $SCRIPT_DIR

echo "        Installing rsyslog"
sudo apt-get -qq install rsyslog -y
echo "        Installing logrotate"
sudo apt-get -qq install logrotate -y

sudo install -d -m 755 -o root -g adm /var/log/containers

sudo cp $SCRIPT_DIR/syslog.conf /etc/rsyslog.d/40-docker.conf
sudo systemctl restart rsyslog

sudo cp $SCRIPT_DIR/logrotate /etc/logrotate.d/docker
sudo mkdir -p /etc/cron.hourly
sudo mv /etc/cron.daily/logrotate /etc/cron.hourly/logrotate

echo "        Setup Script Complete"
