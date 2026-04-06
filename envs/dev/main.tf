provider "aws" {
  region = "eu-central-1"
}

module "vpc" {
  source     = "../../modules/vpc"
  cidr_block = "10.0.0.0/16"
}

module "ec2_public" {
  source            = "../../modules/ec2"
  subnet_id         = module.vpc.public_subnet_id
  vpc_id            = module.vpc.vpc_id
  security_group_id = aws_security_group.web.id
  instance_profile  = "InstanceRole"
  associate_public_ip = true
  name              = "public-instance"
}

module "ec2_private" {
  source            = "../../modules/ec2"
  subnet_id         = module.vpc.private_subnet_id
  vpc_id            = module.vpc.vpc_id
  security_group_id = aws_security_group.web.id
  instance_profile  = "InstanceRole"
  associate_public_ip = false
  name              = "private-instance"
}

resource "aws_security_group" "web" {
  name   = "web-sg"
  vpc_id = module.vpc.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "web_public_ip" {
  value = module.ec2_public.public_ip
}