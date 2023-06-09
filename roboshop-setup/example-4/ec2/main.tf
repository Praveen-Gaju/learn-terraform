data "aws_ami" "ami" {
  most_recent      = true
  name_regex       = "Centos-8-DevOps-Practice"
  owners           = ["973714476881"]
}

resource "aws_instance" "ec2" {
  ami                     = data.aws_ami.ami.image_id
  instance_type           = var.instance_type
  vpc_security_group_ids  = [var.sg_id]
  tags = {
    Name = var.component
  }
}

resource "aws_route53_record" "frontend" {
  zone_id = "Z10378632KDOC11M5RXOI"
  name    = "${var.component}-dev.devopspract.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.ec2.private_ip]
}

variable "component" {}
variable "instance_type" {}
variable "sg_id" {}