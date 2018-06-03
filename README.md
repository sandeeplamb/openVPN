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
