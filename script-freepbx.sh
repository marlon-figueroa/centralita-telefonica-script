
sudo apt-get install apache2 mariadb-server libapache2-mod-php php php-pear php-cgi php-common php-curl php-mbstring php-gd php-mysql php-bcmath php-zip php-xml php-imap php-json php-snmp -y

wget http://mirror.freepbx.org/modules/packages/freepbx/freepbx-16.0-latest.tgz

tar -xvzf freepbx-16.0-latest.tgz

cd freepbx

apt-get install nodejs npm -y

./install -n

fwconsole ma install pm2

sudo sed -i 's/^\(User\|Group\).*/\1 asterisk/' /etc/apache2/apache2.conf

sudo sed -i 's/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf

sudo sed -i 's/\(^upload_max_filesize = \).*/\120M/' /etc/php/7.4/apache2/php.ini

sudo sed -i 's/\(^upload_max_filesize = \).*/\120M/' /etc/php/7.4/cli/php.ini

a2enmod rewrite

systemctl restart apache2

ALTERUSER 'root'@'localhost' IDENTIFIEDBY '';
FLUSHPRIVILEGES;

sudo apt-get install -y build-essential linux-headers-`uname -r` openssh-server\
  bison flex php7.4 php7.4-curl php7.4-cli php7.4-common php7.4-mysql php7.4-gd php7.4-mbstring\
  php7.4-intl php7.4-xml php-pear curl sox libncurses5-dev libssl-dev mpg123 libxml2-dev libnewt-dev sqlite3\
  libsqlite3-dev pkg-config automake libtool autoconf git unixodbc-dev uuid uuid-dev\
  libasound2-dev libogg-dev libvorbis-dev libicu-dev libcurl4-openssl-dev libical-dev libneon27-dev libsrtp2-dev\
  libspandsp-dev sudo subversion libtool-bin python-dev unixodbc dirmngr sendmail-bin sendmail\

sudo wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg

echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/php.list

sudo apt -y install php7.4

sudo apt-get install php7.4-{bcmath,bz2,intl,gd,mbstring,mysql,zip,mysqli,PDO}

sudo apt install php7.4-{common,mysql,xml,xmlrpc,curl,gd,imagick,cli,dev,imap,mbstring,opcache,soap,zip,intl,bcmath,mysqli,PDO} -y

update-alternatives --set php /usr/bin/php7.4

-- Instalacion de herramienta interfaz de bluetooth
sudo apt-get install bluetooth bluez bluez-tools rfkill rfcomm
sudo apt-get install bluez-firmware firmware-atheros
sudo service bluetooth start

ls -l /etc/asterisk/

-- verificar bluetooth encendido
sudo rfkill list

-- desbloqueo de bluetooth
sudo rfkill unblock bluetooth

-- escaneo de dispositivos proximos
sudo hciconfig hci0 up
hcitool scan

sudo nano /etc/asterisk/chan_mobile.conf 

curl-fsSL https://tailscale.com/install.sh | sh

sudo tailscale up

systemctl enable tailscaled

systemctl status tailscaled

bluetoothctl

discoverable on

pairable on

agent on

default-agent

scan on

pair <MAC>

hci0   D8:3A:DD:61:9B:74

phone0  80:19:70:21:27:45 

[general]
interval=30

[adapter]
id=hci0
address=D8:3A:DD:61:9B:74

[phone0]
context=incoming-mobile
address=80:19:70:21:27:45 
adapter=hci0
port=4

rfcomm bind 8 80:19:70:21:27:45 
80:19:70:21:27:45

channel originate mobile/phone0/75941341 application MusicOnHold
channel originate mobile/phone0/77994095 application MusicOnHold

sudo asterisk -rvvv
module load chan_mobile.so
mobile search
core restart now

sudo rfcomm bind 8 80:19:70:21:27:45

ls -l /dev/rf*

mobile show devices

sudo fwconsole ma disablerepo commercial
sudo fwconsole ma installall
curl -sS https://getcomposer.org/installer -o composer-setup.php
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
sudo fwconsole ma installall
fwconsole ma delete firewall
sudo fwconsole ma delete firewall
sudo fwconsole reload
sudo fwconsole restart
sudo service apache2 restart
sudo service apache2 status
sudo fwconsole ma installall
sudo service apache2 status