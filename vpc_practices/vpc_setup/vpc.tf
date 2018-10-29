resource "aws_vpc" "masterVPC" {
  cidr_block           = "${var.vpc_prod_cidr}"
  enable_dns_hostnames = true

  tags {
    Name = "master"
  }
}

## Subnets

resource "aws_subnet" "aws-subnet-master-region-a" {
  vpc_id            = "${aws_vpc.masterVPC.id}"
  cidr_block        = "${var.vpc_master_cidr_region_a}"
  availability_zone = "${var.aws_region}a"

  tags = {
    Name = "master-a"
  }
}

resource "aws_subnet" "aws-subnet-master-region-b" {
  vpc_id            = "${aws_vpc.prodVPC.id}"
  cidr_block        = "${var.vpc_master_cidr_region_b}"
  availability_zone = "${var.aws_region}b"

  tags = {
    Name = "master-b"
  }
}

resource "aws_subnet" "aws-subnet-master-region-c" {
  vpc_id            = "${aws_vpc.masterVPC.id}"
  cidr_block        = "${var.vpc_master_cidr_region_c}"
  availability_zone = "${var.aws_region}c"

  tags = {
    Name = "master-c"
  }
}

## Internet gateway
resource "aws_internet_gateway" "prod_gateway" {
  vpc_id = "${aws_vpc.masterVPC.id}"

  tags {
    Name = "master-gw"
  }
}
