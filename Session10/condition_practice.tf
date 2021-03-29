# provider "aws" {    
#     region = "us-east-1"
# }

# variable "web_server_enabled" {
#   default = false
  
# }
# variable "environment" {

#   default = "prod"
  
# }

# resource "aws_instance" "web" {
#   # count                  = var.web_server_enabled ? 1:0
#   ami                    = "ami-038f1ca1bd58a5790" 
#   instance_type          = var.environment == "dev" ? "t2.micro" : "t2.large"
# #   instance_type          = "t2.micro"
# #   vpc_security_group_ids = [aws_security_group.sg_1.id]
# #   subnet_id              = aws_subnet.public_subnet_1.id
# #   key_name               = var.key_name

# }

#################################################################################

# provider "aws" {
#     region = "us-east-1"
# }
# resource "aws_instance" "web" {
#   for_each = {
#       dev = "t2.micro",
#       prod = "t2.large"
#   }
#   ami                    = "ami-038f1ca1bd58a5790"
#   instance_type          = each.value
#   tags = {
#     # Name = "My_web ${count.index}"
#       Name = "My_web ${each.key}"
#   }
# }
