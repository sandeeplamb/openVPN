#!/bin/bash
yum install openvpn -y
modprobe iptable_nat
echo 1 | tee /proc/sys/net/ipv4/ip_forward
iptables -t nat -A POSTROUTING -s 10.4.0.1/2 -o eth0 -j MASQUERADE
iptables -t nat -A POSTROUTING -s 10.8.0.0/24 -o eth0 -j MASQUERADE
chkconfig openvpn on

### Easy-RSA-Setup
yum install easy-rsa -y --enablerepo=epel
mkdir /etc/openvpn/easy-rsa
cd /etc/openvpn/easy-rsa
cp -Rv /usr/share/easy-rsa/3.0.3/* .

### Server-Setup
./easyrsa init-pki
./easyrsa --batch --req-cn=serverCN build-ca nopass
./easyrsa gen-dh
./easyrsa --batch --req-cn=myvpn gen-req server nopass
echo yes | ./easyrsa sign-req server server

### Client-Setup
./easyrsa --batch --req-cn=clientCN gen-req client nopass
echo yes | ./easyrsa sign-req client client
