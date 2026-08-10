terraform {
  backend "s3" {
    bucket  = "speshway-bootstrap-tfstate-ap-south-1"
    key     = "environments/qa/terraform.tfstate"
    region  = "ap-south-1"
    encrypt = true
  }
}
