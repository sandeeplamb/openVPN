############################################################################
######## AWS-Provider-and-Module-Definition-Only-Below-This ################
############################################################################

### AWS-Provider
provider "aws" {
  access_key        = "${var.access_key}"
  secret_key        = "${var.secret_key}"
  region            = "${var.region}"
}


### 01.Module-openVPN
module "openVPN" {
  source            = "./openVPN"
  access_key        = "${var.access_key}"
  secret_key        = "${var.secret_key}"
  region            = "${var.region}"
}

