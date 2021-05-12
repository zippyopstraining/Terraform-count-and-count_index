provider "aws" {
  region     = "us-east-1"
  access_key = "Your_access_key"
  secret_key = "Your_secret_key"
}

resource "aws_instance" "server" {
  count = 4 # create four similar EC2 instances

  ami           = "ami-042e8287309f5df03"
  instance_type = "t2.micro"

  tags = {
    Name = "instance ${count.index}"
  }
}


variable "subnet_ids" {
  type = string
  }

resource "aws_instance" "subnet" {
  # Create one instance for each subnet
  count = length(var.subnet_ids)

  ami           = "ami-042e8287309f5df03"
  instance_type = "t2.micro"
  subnet_id     = var.subnet_ids

  tags = {
    Name = "subnet ${count.index}"
  }
}
