# Request a spot instance
resource "aws_spot_instance_request" "node1" {
  ami                     = "ami-04d9ca43b6449e12a"
  vpc_security_group_ids  = ["sg-0149e76eef2a1cd6a"]
  instance_type           = "t2.micro"
  wait_for_fulfillment    = true

  tags = {
    Name = "prom-test-server"
  }
}


resource "aws_ec2_tag" "node1" {
  resource_id = aws_spot_instance_request.node1.spot_instance_id
  key         = "Name"
  value       = "prom-test-server"
}

resource "aws_spot_instance_request" "node2" {
  ami                     = "ami-04d9ca43b6449e12a"
  vpc_security_group_ids  = ["sg-0149e76eef2a1cd6a"]
  instance_type           = "t2.micro"
  wait_for_fulfillment    = true

  tags = {
    Name = "prom-test-node"
  }
}

resource "aws_ec2_tag" "node2" {
  resource_id = aws_spot_instance_request.node2.spot_instance_id
  key         = "Name"
  value       = "prom-test-node"
}