provider "aws" {
  region = "us-east-1"

}

variable "subee" {

}
resource "aws_vpc" "buulaay-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "This is a vpc for for labs"
  }
}

data "aws_vpc" "existing_vpc" {
  default = true

}
resource "aws_subnet" "dev-subnet" {
  vpc_id            = data.aws_vpc.existing_vpc.id
  cidr_block        = "172.31.48.0/20"
  availability_zone = "us-east-1a"
  tags = {
    Name = " This is for labbing"
  }

}

output "dev-vpc-id" {
  value = aws_vpc.buulaay-vpc.id
}

output "dev-subnet-id" {
  value = aws_subnet.dev-subnet.id
}

