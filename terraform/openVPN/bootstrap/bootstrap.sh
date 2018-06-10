#!/bin/bash


function log() {
  echo "[$(date)] $1" | tee -a /var/log/openvpn_init.log
}

log '[INFO] Preparing openVPN'

yum install openvpn -y
modprobe iptable_nat
echo 1 | tee /proc/sys/net/ipv4/ip_forward
iptables -t nat -A POSTROUTING -s 10.4.0.1/2 -o eth0 -j MASQUERADE
iptables -t nat -A POSTROUTING -s 10.8.0.0/24 -o eth0 -j MASQUERADE
chkconfig openvpn on

### Easy-RSA-Setup
log '[INFO] Preparing Easy-RSA'
yum install easy-rsa -y --enablerepo=epel
mkdir /etc/openvpn/easy-rsa
cd /etc/openvpn/easy-rsa
cp -Rv /usr/share/easy-rsa/3.0.3/* .

### Server-Setup
log '[INFO] Preparing Server-Setup'
/etc/openvpn/easy-rsa/easyrsa init-pki
/etc/openvpn/easy-rsa/easyrsa --batch --req-cn=serverCN build-ca nopass
/etc/openvpn/easy-rsa/easyrsa gen-dh
/etc/openvpn/easy-rsa/easyrsa --batch --req-cn=serverCN gen-req server nopass
echo yes | /etc/openvpn/easy-rsa/easyrsa sign-req server server

### Client-Setup
/etc/openvpn/easy-rsa/easyrsa --batch --req-cn=clientCN gen-req client nopass
echo yes | /etc/openvpn/easy-rsa/easyrsa sign-req client client

### OpenVPN Setup
log '[INFO] Preparing Open-VPN-Setup'
cd /etc/openvpn
openvpn --genkey --secret pfs.key
yum install git -y
cd /tmp
mkdir project
cd project
git clone https://github.com/sandeeplamb/openVPN-AWS.git .
cp terraform/openVPN/bootstrap/server.conf /etc/openvpn/
cp terraform/openVPN/bootstrap/server.sh /etc/openvpn/
cd /tmp
rm -rf project
cd /etc/openvpn
service openvpn start
chkconfig openvpn on

### Make-Keys
log '[INFO] Preparing Keys'
cd /etc/openvpn
mkdir keys
cp pfs.key keys
cp /etc/openvpn/easy-rsa/pki/dh.pem keys
cp /etc/openvpn/easy-rsa/pki/ca.crt keys
cp /etc/openvpn/easy-rsa/pki/private/ca.key keys
cp /etc/openvpn/easy-rsa/pki/private/client.key keys
cp /etc/openvpn/easy-rsa/pki/issued/client.crt keys
chmod 777 -R keys

### Change-back-permissions after copying
#cd /etc/openvpn/keys
#chmod 600 *