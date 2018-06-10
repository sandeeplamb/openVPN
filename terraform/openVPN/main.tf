############################################################################
######## AWS-Resources-Definition-Only-Below-This ##########################
############################################################################


######## EC2-Instance-Security-Group
resource "aws_security_group" "openVPNSG" {
  name        = "openVPNSG"
  description = "Allow traffic only from Internet for SSH, HTTP and HTTPS"
  vpc_id      = "${lookup(var.vpcOpenVPN, var.region)}"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
    description	= "Allow HTTP"
  }
 
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
    description	= "Allow HTTPS"
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
    description	= "Allow SSH"
  }

  ingress {
    from_port   = 1194
    to_port     = 1194
    protocol    = "UDP"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow UDP Traffic for port 1194"
  }

  egress {
    from_port       	= 0
    to_port         	= 65535
    protocol        	= "TCP"
    cidr_blocks     	= ["0.0.0.0/0"]
    description		    = "Allow all Outgoing Traffic"
  }
  
  tags {
    Name 		    = "openVPNSG"
    Created_by		= "Sandeep"
    Created_from	= "Terraform"
 }
}



######## EC2-Instance
resource "aws_instance" "openVPN" {
        ami                               = "${lookup(var.ami, var.region)}"
        instance_type                     = "t2.micro"
        subnet_id                         = "${lookup(var.Public_Subnet_id, var.region)}"
        source_dest_check                 = false
        associate_public_ip_address       = true
        security_groups                   =  ["${aws_security_group.openVPNSG.id}"]
        key_name                          = "aws-sandbox"
        user_data                         = "${file("openVPN/bootstrap/bootstrap.sh")}"

        lifecycle {
            ignore_changes                = ["tags","user_data"]
        }


        tags {
            Name                           = "openVPN"
            Created_By                     = "Sandeep"
            Created_From                   = "Terrafrom"
        }
}

  ############################################################################
  ############################################################################