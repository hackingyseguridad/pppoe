#!/bin/sh
# 1º Configurar los interfaces del PC
# vim /etc/network/interfaces
# Eth0 192.168.1.1/24 para la WAN fibra PPPoE
# Eth1 192.168.2.x/24 para la LAN
# 2º Habilitar forward
# vim /etc/sysctl.conf
# net.ipv4.ip_forward=1
# net.ipv6.ip_forward=1
# 3º Instalacion vlan y pppoeconf
sudo apt-get install vlan pppoeconf
sudo su -c 'echo "8021q" >> /etc/modules'
# 4º.- Editamos /etc/network/interfaces y añadimos
# auto eth0.6
# iface eth0.6 inet static
# address 172.0.0.1
# netmask 255.0.0.0
# 5º Reset
# sudo reboot
# 5º configuramos la conexion PPPoE
sudo pppoeconf eth0.6
