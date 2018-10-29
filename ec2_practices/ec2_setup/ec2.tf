provider "aws" {
  region = "${var.region}"
}

resource "aws_instance" "ami" {
  ami           = "ami-054266d2576775c8e"
  instance_type = "t2.micro"
}
