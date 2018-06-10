<p align="center">
  <img src="img/openvpn_aws.png" width="350"> </image>
</p>

# openVPN
openVPN is open source software which is use to create point-to-point or site-to-site VPN connections.
It is free and just under few click you can create your own VPN-Server and can surf the internet securely for free.

### Why you a Need a VPN

1. For Privacy.
1. When you are in public Wi-Fi.
1. Accessing sites in another country.
1. When you are remote worker/student.

There are numerous reasons and there are number of free and paid VPN's in the market.
But let's create our own VPN-Server using opneVPN and have control on every single byte of data that you shared while surfing internet.

### How to create your own VPN using AWS

I will create the openVPN server in AWS using terraform. The most important thing to consider is the Region in which you want to create your EC2 instance.

Depending on the Region chosen, we will get the IP-Address of that region.

For sake of simplicity, I am chosing reason as US-EAST-2

### Terraform to create the AWS Resources

You need a free-tier AWS account and terraform installed on your local machine.

We will run the terraform module which will create the openVPN server with just few commands. 

Ofcourse, you need to clone the module and modify it as per needs.

### User-Data

The bootstrapping of openVPN is done using the script present in module `openVPN/bootstrap/bootstrap.sh`.

The setup of Server and Client is done automatically.

### Terraform Commands

`cd terraform`

`terraform init`

`terraform validate`

`terraform plan --var-file=terraformtfvars`

`terraform apply --var-file=terraformtfvars`


### Client-Keys

The client certificates as well as pf.key and ca.crt and ca.key have to be downloaded from server.

I use following command to get the keys.

`scp -r -i aws-ec2.pem ec2-user@EC2-IP-ADDRESS:/etc/openvpn/keys/ .`

### Client-Conf

You can copy the client.conf file from `openVPN/bootstrap/client.conf`.

Just needed to amend the IP-Address of your EC2.

### openVPN Client.

You can install the openVPN client of official website.

For Mac, the client is Tunnel-Blick.

### Testing

From openVPN client, open the location of client.conf and connect.

If all steps are performed well, you will have your VPN up and running.
