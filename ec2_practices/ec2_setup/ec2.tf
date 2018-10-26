provider "aws" {
  region = "${var.region1}"
}

resource "aws_instance" "ami" {
  ami           = "ami-063aa838bd7631e0b"
  instance_type = "t2.micro"
}

provider "aws" {
  region = "${var.region2}"
}

resource "aws_instance" "ami" {
  ami           = "ami-0ac019f4fcb7cb7e6"
  instance_type = "t2.micro"
}

provider "aws" {
  region = "${var.region2}"
}

resource "aws_instance" "ami" {
  ami           = ""
  instance_type = "t2.micro"
}
