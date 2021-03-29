provider "aws" {
  region = var.region
}

module "myapp-vpc" {
  source = "github.com/sprintqaDevOps/vpc"
  # source = "./vpc"

  cidr_block_vpc    = var.cidr_block_vpc
  prefix            = var.prefix
  cidr_block_subnet = var.cidr_block_subnet
  cidr_block_route  = var.cidr_block_route
}

module "myapp-webserver" {
  source = "github.com/sprintqaDevOps/web-server"
  # source = "./web-server"
  # count               = 2
  key_name            = var.key_name
  ssh_key_path        = var.ssh_key_path
  ami                 = var.ami
  instance_type       = var.instance_type
  subnet_id           = module.myapp-vpc.subnet.id  //reference to vpc module output 
  vpc_id              = module.myapp-vpc.my_vpc.id //reference to vpc module output
  prefix              = var.prefix
  security_group_name = var.security_group_name

  depends_on = [
    module.myapp-vpc
  ]

}
