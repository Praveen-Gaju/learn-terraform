resource "aws_instance" "condition" {
  ami           = "ami-0089b8e98cd95257d"
  #here instance type is taken from variable in condition format
  #if variable instance_type is empty consider t3.micro other wise take variable mentioned in instance_type
  instance_type = var.instance_type == "" ? "t3.micro" : var.instance_type #condition
}

variable "instance_type" {}

variable "create_instance" {}

resource "aws_instance" "boolean_condition" {
  count         = tobool(var.create_instance) ? 1 : 0
  ami           = "ami-0089b8e98cd95257d"
  instance_type = var.instance_type == "" ? "t3.micro" : var.instance_type
}