terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.60.0"
    }
  }
}

variable "db_name" {
  type    = string
  default = "psdb"
}

variable "db_username" {}
variable "db_password" {}

provider "aws" {
  profile = "default"
  region  = "eu-north-1"
}


# create a security group to allow db acces only for a specific IP address
resource "aws_security_group" "allow_specific_ip" {
  name        = "allow_specific_ip"
  description = "Allow only a specific IP address (13.81.247.65) to access this db instance"



}

resource "aws_vpc_security_group_egress_rule" "allow_specific_ip_egress" {
  security_group_id = aws_security_group.allow_specific_ip.id
  cidr_ipv4         = "13.81.247.65/32"
  ip_protocol       = "tcp"
  from_port         = 3306
  to_port           = 3306
}

resource "aws_vpc_security_group_ingress_rule" "allow_specific_ip_ingress" {
  security_group_id = aws_security_group.allow_specific_ip.id
  description       = "Allow only connections made from this IP address"

  cidr_ipv4   = "13.81.247.65/32"
  ip_protocol = "tcp"
  from_port   = 3306
  to_port     = 3306
}

resource "aws_db_instance" "ps-db" {
  allocated_storage = 10 #10GiB
  db_name           = var.db_name
  instance_class    = "db.t3.micro"

  engine         = "mysql"
  engine_version = "8.0"
  username       = var.db_username # provided as environment variable TF_VAR_db_username
  password       = var.db_password # provided as environment variable TF_VAR_db_password

  storage_encrypted = true

  publicly_accessible = true # necessary to allow machines that are outside of the vpc to access this instance

  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true

  vpc_security_group_ids = [aws_security_group.allow_specific_ip.id]
}



