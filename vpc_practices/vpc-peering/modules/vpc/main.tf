## AWS details
provider "aws" {
  region     = "${var.aws_region}"
}

## VPC
resource "aws_vpc" "vpc" {
  cidr_block           = "${var.vpc_cidr_prefix}.0.0/16"
  enable_dns_hostnames = true

  tags {
    Name = "${var.vpc_cidr_prefix}-vpc"
  }
}

## AWS public subnet
resource "aws_subnet" "pub" {
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${var.vpc_cidr_prefix}.1.0/24"
  availability_zone = "${var.aws_region}"

  tags {
    Name = "${var.vpc_cidr_prefix}.pub"
  }
}

## AWS internet gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    Name = "${var.vpc_cidr_prefix}-igw"
  }
}

## AWS public route table
resource "aws_route_table" "pub" {
  vpc_id = "${aws_vpc.vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }

  route {
    cidr_block                = "${var.vpc_cidr_prefix}.0.0/16"
    vpc_peering_connection_id = "${aws_vpc_peering_connection.vpc1_2.id}"
  }

  route {
    cidr_block                = "${var.vpc_cidr_prefix}.0.0/16"
    vpc_peering_connection_id = "${aws_vpc_peering_connection.vpc1_3.id}"
  }

  tags {
    Name = "${var.vpc_cidr_prefix}-pub"
  }
}

## AWS public route table association
resource "aws_route_table_association" "pub" {
  subnet_id      = "${aws_subnet.pub.id}"
  route_table_id = "${aws_route_table.pub.id}"
}
