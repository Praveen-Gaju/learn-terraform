#Using data source for creating ami image id
data "aws_ami" "ami" {
  most_recent      = true
  name_regex       = "Centos-8-DevOps-Practice"
  owners           = ["973714476881"]
}

#AWS ec2 servers
resource "aws_instance" "frontend" {
  count                   = 5                           #count will act as loop and create 5 instances
  ami                     = data.aws_ami.ami.image_id   #used data block as reference for image id  to create ec2 instance
  instance_type           = "t2.micro"
  vpc_security_group_ids  = ["sg-0149e76eef2a1cd6a"]
  tags = {
    Name = "frontend"
  }
}


resource "aws_instance" "frontend" {
  count                   = length(var.instances) #use variable for creating the number of instances
  ami                     = data.aws_ami.ami.image_id
  instance_type           = "t2.micro"
  vpc_security_group_ids  = ["sg-0149e76eef2a1cd6a"]
  tags = {
    Name = var.instances[count.index]
    #it will access the variable instances and give tag as specified in variables
  }
}

variable "instances" {
  default = ["cart", "catalogue", "user", "payment", "shipping"]
}


output "public_ip" {
  value = aws_instance.frontend.*.public_ip
}