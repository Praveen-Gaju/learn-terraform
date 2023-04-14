resource "aws_route53_record" "frontend" {
  zone_id = "Z10378632KDOC11M5RXOI"
  name    = "${var.component}-dev.devopspract.online"
  type    = "A"
  ttl     = 30
  records = [var.private_ip]
}

variable "private_ip" {}
variable "component" {}
