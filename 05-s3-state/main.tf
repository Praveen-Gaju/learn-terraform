terraform {
  backend "s3" {
    bucket = "devopspract"
    key    = "05-s3-state/terraform.tfstate"
    region = "us-east-1"
  }
}

resource "aws_instance" "ec2" {
  ami = "ami-0089b8e98cd95257d"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-0149e76eef2a1cd6a"]
  tags = {
    Name = "demo"
  }
}