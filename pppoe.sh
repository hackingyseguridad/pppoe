tail pppoe.sh
# 1º Configurar los interfaces del PC
# vim /etc/network/interfaces
# Eth0 192.168.1.1/24 para la WAN fibra PPPoE
# Eth1 192.168.2.x/24 para la LAN
# 2º Habilitar forward
# vim /etc/sysctl.conf
# net.ipv4.ip_forward=1
# net.ipv6.ip_forward=1
# 3º Conf firewall
# iptables -t nat -A POSTROUTING -s 192.168.2.0/24 -o eth0 -j MASQUERADE
# iptables-save > /etc/firewall.conf
# vim /etc/network/if-up.d/iptables
#!/bin/sh
# iptables-restore < /etc/firewall.conf
# chmod +x /etc/network/if-up.d/iptables
# 4º Vlan de datos
sudo apt-get install vlan pppoeconf
sudo su -c 'echo "8021q" >> /etc/modules'
auto eth0.6
iface eth0.6 inet static
sudo reboot
# 5º configuramos la conexion PPPoE
sudo pppoeconf
