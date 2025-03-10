provider "aws" {
  region = "ap-southeast-3"
}

resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "TerraformVPC"
  }
}

resource "aws_subnet" "example" {
  vpc_id            = aws_vpc.example.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-southeast-3a"

  tags = {
    Name = "TerraformSubnet"
  }
}

resource "aws_instance" "example" {
  ami           = "ami-06cfb597d8581294e"
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.example.id

  tags = {
    Name = "TerraformEC2"
  }
} 
