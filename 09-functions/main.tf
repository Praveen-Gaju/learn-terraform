variable "test" {
  default = {
    "catalogue" = {
      "private_ip" = "172.31.2.133"
    }
    "user" = {
      "private_ip" = "172.31.3.111"
    }
  }
}

output "test" {
  value = var.test["catalogue"].private_ip
}

