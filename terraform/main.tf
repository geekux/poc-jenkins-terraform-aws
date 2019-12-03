terraform {
  backend "s3" {
    bucket = "terrabucket001"
    key    = "terraform/terraform.tfstate"
    region = "eu-central-1"
  }
}

provider "aws" {
  region                  = "eu-central-1"
}

resource "aws_instance" "web" {
  ami = "ami-0cc293023f983ed53"
  instance_type = "t2.micro"
  tags = {
    Name = "poc-instance-1"
  }
}

