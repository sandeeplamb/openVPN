############################################################################
## Global-Variables
############################################################################
## Variable - Access-Key
variable "access_key" {
  description = "AWS-Sandbox Account Access Key"
}

## Variable Secret-Key
variable "secret_key" {
  description = "AWS-Sandbox Account Secret Key"
}

## Variable Region
variable "region" {
  description = "AWS-Region"
  default     = "us-east-2"
}

## Variable AMI 
## Change the AMI ID depending on your Region.
variable "ami" {
  description = "AWS-AMI's per Region"
  type        = "map"

  default = {
    us-east-1       = "ami-14c5486b"
    us-east-2       = "ami-922914f7"
    us-west-1       = "ami-25110f45"
    us-west-2       = "ami-25615740"
    ap-northeast-1  = "ami-92df37ed"
    ap-northeast-2  = "ami-c10fa6af"
    ap-southeast-1  = "ami-de90a5a2"
    ap-southeast-2  = "ami-423bec20"
    ca-central-1    = "ami-338a0a57" 
    cn-north-1      = "ami-3885d854"
    eu-central-1    = "ami-9a91b371"
    eu-west-1       = "ami-ca0135b3"
    eu-west-2       = "ami-a36f8dc4"
    eu-west-3       = "ami-969c2deb"
    sa-east-1       = ""
    ap-northeast-3  = ""
    ap-south-1      = ""
  }
}

variable "Public_Subnet_id" {
  description = "Subnet-ID-for-Default-Subnet-of-VPC-Of-Region"
  type        = "map"
  default = {
    us-east-1       = "subnet-3d315455"
    us-east-2       = "subnet-3d315455"
    us-west-1       = "subnet-3d315455"
    us-west-2       = "subnet-3d315455"
    ap-northeast-1  = "subnet-3d315455"
    ap-northeast-2  = "subnet-3d315455"
    ap-southeast-1  = "subnet-3d315455"
    ap-southeast-2  = "subnet-3d315455"
    ca-central-1    = "subnet-3d315455" 
    cn-north-1      = "subnet-3d315455"
    eu-central-1    = "subnet-3d315455"
    eu-west-1       = "subnet-3d315455"
    eu-west-2       = "subnet-3d315455"
    eu-west-3       = "subnet-3d315455"
    sa-east-1       = "subnet-3d315455"
    ap-northeast-3  = ""
    ap-south-1      = ""
    }
}

variable "vpcOpenVPN" {
    description = "Subnet-ID-for-Default-Subnet-of-VPC-Of-Region"
    type        = "map"
    default = {
        us-east-1       = "vpc-6f195814"
        us-east-2       = "vpc-e80d6180"
        us-west-1       = "vpc-e73ea680"
        us-west-2       = "vpc-0e3b0a77"
        ap-northeast-1  = "vpc-da1e72bd"
        ap-northeast-2  = "vpc-50437438"
        ap-southeast-1  = "vpc-43e19624"
        ap-southeast-2  = "vpc-12a23a75"
        ca-central-1    = "vpc-b365c0db" 
        eu-central-1    = "vpc-ac7de2c7"
        eu-west-1       = "vpc-760a9110"
        eu-west-2       = "vpc-0f5a8e67"
        eu-west-3       = "vpc-a5d0b7cc"
        sa-east-1       = "vpc-9060f6f7"
        ap-northeast-3  = ""
        ap-south-1      = ""
    }
}