terraform {
  backend "s3" {
    bucket  = "speshway-bootstrap-tfstate-us-east-1"
    key     = "environments/test/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}
