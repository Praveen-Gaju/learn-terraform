variable "sample" {
  default = "Hello World"
}

output "sample" {
  value = var.sample
}

variable "sample1" {} //declaration of variable

output "sample1" {
  value = var.sample1
}

variable "cli" {}

output "cli" {
  value = var.cli
}

variable "input" {}


variable "sample2" {
  default = "HELLO"
}

variable "sample3" {
  default = [
    "HELLO",
    "WORLD",
    1000,
    true
  ]
}


variable "sample4" {
  default = {
    string = "Hello",
    number = 1000,
    boolean = true
  }
}

output "types" {
  value = "variable sample2 is: ${var.sample2}, first value in list is ${var.sample3[0]}, Boolean value of map is ${var.sample4["boolean"]}"
}