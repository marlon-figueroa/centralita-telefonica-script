

sudo apt-get update -y

sudo apt-get install unzip git sox gnupg2 curl libnewt-dev libssl-dev libncurses5-dev subversion libsqlite3-dev build-essential libjansson-dev libxml2-dev uuid-dev subversion -y

wget http://downloads.asterisk.org/pub/telephony/asterisk/asterisk-19.8.1.tar.gz

sudo apt install subversion

tar -xvzf asterisk-20-current.tar.gz

cd asterisk-20.4.0

contrib/scripts/get_mp3_source.sh

contrib/scripts/install_prereq install

./configure

make menuselect

make -j2

make install

make samples

make config

ldconfig

-- Paso 2

groupadd asterisk

useradd -r -d /var/lib/asterisk -g asterisk asterisk

usermod -aG audio,dialout asterisk

chown -R asterisk:asterisk /etc/asterisk

chown -R asterisk:asterisk /var/{lib,log,spool}/asterisk

chown -R asterisk:asterisk /usr/lib/asterisk

nano /etc/default/asterisk
AST_USER="asterisk"
AST_GROUP="asterisk"

nano /etc/asterisk/asterisk.conf
runuser = asterisk ; The user to run as.
rungroup = asterisk ; The group to run as.

systemctl restart asterisk

systemctl enable asterisk

systemctl status asterisk

sudo sed -i 's";\[radius\]"\[radius\]"g' /etc/asterisk/cdr.conf

sudo sed -i 's";radiuscfg => /usr/local/etc/radiusclient-ng/radiusclient.conf"radiuscfg => /etc/radcli/radiusclient.conf"g' /etc/asterisk/cdr.conf

sudo sed -i 's";radiuscfg => /usr/local/etc/radiusclient-ng/radiusclient.conf"radiuscfg => /etc/radcli/radiusclient.conf"g' /etc/asterisk/cel.conf

sudo systemctl stop asterisk

sudo systemctl start asterisk

sudo systemctl status asterisk

-- Acceso a linea de comando de asterisk
asterisk -rvvvv