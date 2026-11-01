terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "restaurant_server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = "restaurant-key"

  tags = {
    Name = "Restaurant-Website-Server"
  }
}