#Using data source for creating ami image id
data "aws_ami" "ami" {
  most_recent      = true
  name_regex       = "Centos-8-DevOps-Practice"
  owners           = ["973714476881"]
}

#AWS ec2 servers
resource "aws_instance" "instances" {
  for_each                = var.instances   #referred from variables
  ami                     = data.aws_ami.ami.image_id
  instance_type           = each.value["type"]   #referred from the variables
  vpc_security_group_ids  = ["sg-0149e76eef2a1cd6a"]
  tags = {
    Name = "frontend"
  }
}

variable "instances" {
  default = {
    catalogue = {
      name = "catalogue"
      type = "t3.micro"
    }
    frontend = {
      name = "frontend"
      type = "t2.small"
    }
    user = {
      name = "user"
      type = "t3.large"
    }
    cart = {
      name = "cart"
      type = "t2.micro"
    }
  }
}

output "ec2" {
  #print the output of particular instances public ip below is the standard format
  #here k=key, v=value refers kar value pair from above variable name instances
  value = [for k, v in aws_instance.instances : "${k} - ${v.public_ip} "]
}


## above code can be written in different way as shown below but it is not mature way to write the code

variable "names" {
  default = ["catalogue", "frontend", "user", "cart"]
}

variable "type" {
  default = ["t3.micro", "t2.small", "t3.large", "t2.micro"]
}

resource "aws_instance" "instances" {
  count                   = length(var.names)   #count will be length of name variable
  ami                     = data.aws_ami.ami.image_id
  instance_type           = var.type[count.index]   #referred from the variable type
  vpc_security_group_ids  = ["sg-0149e76eef2a1cd6a"]
  tags = {
    Name = var.names[count.index]  #referred from variable names
  }
}


##variable as list this code is little mature code but there will be referencing problem

variable "list" {
  default = [
    {
      name = "catalogue"
      type = "t3.micro"
    },
    {
      name = "frontend"
      type = "t3.small"
    },
    {
      name = "user"
      type = "t3.large"
    },
    {
      name = "cart"
      type = "t2.micro"
    }
  ]
}

resource "aws_instance" "instances" {
  count                   = length(var.list) #count will be length of name variable
  ami                     = data.aws_ami.ami.image_id
  instance_type           = var.list[count.index]["type"]   #referred from the variable list
  vpc_security_group_ids  = ["sg-0149e76eef2a1cd6a"]
  tags = {
    Name = var.list[count.index]["name"]  #referred from variable names
  }
}

