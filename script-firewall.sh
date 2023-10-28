--
-- Manejo de tools ufw para iptables.
--
which ufw
-- sino esta
sudo apt-get install ufw

sudo su
ufw allow asterisk
ufw allow apache2
ufw allow mysql -- mariadb

-- activar firewall
ufw enable
ufw status verbose
-- activar para 5060 de asterisk

ufw allow 5060
ufw allow 80

ufw status verbose

-- Ejemplo de negar puerto para evitar acceso externo
ufw deny 80

ufw status

ufw status numbered

