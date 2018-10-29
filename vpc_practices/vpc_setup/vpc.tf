resource "aws_vpc" "prodVPC" {
  cidr_block           = "${var.vpc_prod_cidr}"
  enable_dns_hostnames = true

  tags {
    Name = "prod"
  }
}

## Subnets

resource "aws_subnet" "aws-subnet-prod-region-a" {
  vpc_id            = "${aws_vpc.prodVPC.id}"
  cidr_block        = "${var.vpc_prod_cidr_region_a}"
  availability_zone = "${var.aws_region}a"

  tags = {
    Name = "prod-a"
  }
}

resource "aws_subnet" "aws-subnet-prod-region-b" {
  vpc_id            = "${aws_vpc.prodVPC.id}"
  cidr_block        = "${var.vpc_prod_cidr_region_b}"
  availability_zone = "${var.aws_region}b"

  tags = {
    Name = "prod-b"
  }
}

resource "aws_subnet" "aws-subnet-prod-region-c" {
  vpc_id            = "${aws_vpc.prodVPC.id}"
  cidr_block        = "${var.vpc_prod_cidr_region_c}"
  availability_zone = "${var.aws_region}c"

  tags = {
    Name = "prod-c"
  }
}

## Internet gateway
resource "aws_internet_gateway" "prod_gateway" {
  vpc_id = "${aws_vpc.prodVPC.id}"

  tags {
    Name = "prod-gw"
  }
}
