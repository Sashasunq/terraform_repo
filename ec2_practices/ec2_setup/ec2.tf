provider "aws" {
  region = "${var.region}"
}

resource "aws_instance" "ami" {
  ami            = "ami-0bdf93799014acdc4"
  instance_type  = "t2.micro"
}
