#AWS ec2 servers
resource "aws_instance" "frontend" {
  ami = "ami-0089b8e98cd95257d"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-0149e76eef2a1cd6a"]
  tags = {
    Name = "frontend"
  }
}

#AWS route 53 record
resource "aws_route53_record" "frontend" {
  zone_id = "Z10378632KDOC11M5RXOI"
  name    = "frontend-dev.devopspract.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.frontend.private_ip]
}

resource "aws_instance" "mongodb" {
  ami = "ami-0089b8e98cd95257d"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-0149e76eef2a1cd6a"]
  tags = {
    Name = "mongodb"
  }
}

resource "aws_route53_record" "mongodb" {
  zone_id = "Z10378632KDOC11M5RXOI"
  name    = "mongodb-dev.devopspract.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.mongodb.private_ip]
}

resource "aws_instance" "catalogue" {
  ami = "ami-0089b8e98cd95257d"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-0149e76eef2a1cd6a"]
  tags = {
    Name = "catalogue"
  }
}

resource "aws_route53_record" "catalogue" {
  zone_id = "Z10378632KDOC11M5RXOI"
  name    = "catalogue-dev.devopspract.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.catalogue.private_ip]
}

resource "aws_instance" "redis" {
  ami = "ami-0089b8e98cd95257d"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-0149e76eef2a1cd6a"]
  tags = {
    Name = "redis"
  }
}

resource "aws_route53_record" "redis" {
  zone_id = "Z10378632KDOC11M5RXOI"
  name    = "redis-dev.devopspract.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.redis.private_ip]
}

resource "aws_instance" "user" {
  ami = "ami-0089b8e98cd95257d"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-0149e76eef2a1cd6a"]
  tags = {
    Name = "user"
  }
}

resource "aws_route53_record" "user" {
  zone_id = "Z10378632KDOC11M5RXOI"
  name    = "user-dev.devopspract.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.user.private_ip]
}

resource "aws_instance" "cart" {
  ami = "ami-0089b8e98cd95257d"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-0149e76eef2a1cd6a"]
  tags = {
    Name = "cart"
  }
}

resource "aws_route53_record" "cart" {
  zone_id = "Z10378632KDOC11M5RXOI"
  name    = "cart-dev.devopspract.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.cart.private_ip]
}

resource "aws_instance" "mysql" {
  ami = "ami-0089b8e98cd95257d"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-0149e76eef2a1cd6a"]
  tags = {
    Name = "mysql"
  }
}

resource "aws_route53_record" "mysql" {
  zone_id = "Z10378632KDOC11M5RXOI"
  name    = "mysql-dev.devopspract.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.mysql.private_ip]
}


resource "aws_instance" "shipping" {
  ami = "ami-0089b8e98cd95257d"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-0149e76eef2a1cd6a"]
  tags = {
    Name = "shipping"
  }
}

resource "aws_route53_record" "shipping" {
  zone_id = "Z10378632KDOC11M5RXOI"
  name    = "shipping-dev.devopspract.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.shipping.private_ip]
}

resource "aws_instance" "rabbitmq" {
  ami = "ami-0089b8e98cd95257d"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-0149e76eef2a1cd6a"]
  tags = {
    Name = "rabbitmq"
  }
}

resource "aws_route53_record" "rabbitmq" {
  zone_id = "Z10378632KDOC11M5RXOI"
  name    = "rabbitmq-dev.devopspract.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.rabbitmq.private_ip]
}

resource "aws_instance" "payment" {
  ami = "ami-0089b8e98cd95257d"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-0149e76eef2a1cd6a"]
  tags = {
    Name = "payment"
  }
}

resource "aws_route53_record" "payment" {
  zone_id = "Z10378632KDOC11M5RXOI"
  name    = "payment-dev.devopspract.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.payment.private_ip]
}

resource "aws_instance" "dispatch" {
  ami = "ami-0089b8e98cd95257d"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-0149e76eef2a1cd6a"]
  tags = {
    Name = "dispatch"
  }
}

resource "aws_route53_record" "dispatch" {
  zone_id = "Z10378632KDOC11M5RXOI"
  name    = "dispatch-dev.devopspract.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.dispatch.private_ip]
}