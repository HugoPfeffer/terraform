provider "aws" {
  version = "~> 3.0"
  region  = "us-east-1"
}

# Create a VPC
resource "aws_instance" "dev" {
    count = 3
  ami = "ami-0dba2cb6798deb6d8"
  instance_type = "t2.micro"
  key_name = "terraform-aws"
  tags = {
    Name = "dev${count.index}"
  }
  vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
  # vpc_security_group_ids = ["sg-9e3afbc5"]
}
resource "aws_instance" "dev4" {
  ami = "ami-0dba2cb6798deb6d8"
  instance_type = "t2.micro"
  key_name = "terraform-aws"
  tags = {
    Name = "dev4"
  }
  vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
  depends_on = [aws_s3_bucket.dev4]
}
resource "aws_instance" "dev5" {
  ami = "ami-0dba2cb6798deb6d8"
  instance_type = "t2.micro"
  key_name = "terraform-aws"
  tags = {
    Name = "dev5"
  }
  vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
}

resource "aws_s3_bucket" "dev4" {
  bucket = "hpfefferlabs-dev4"
  acl    = "private"

  tags = {
    Name        = "hpfefferlabs-dev4"
  }
}

resource "aws_security_group" "acesso-ssh" {
  name        = "acesso-ssh"
  description = "Acesso ssh"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["192.168.0.19/32" , "189.6.17.200/32"]
  }

  tags = {
    Name = "ssh"
  }
}