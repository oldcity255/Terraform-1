terraform {
  backend "s3" {
    bucket = "vepas-terraform-state-file"
    key    = "tfstate/session9.tfstate"
    region = "us-east-1"
  }
}