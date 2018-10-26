## VPC Peering connections
resource "aws_vpc_peering_connection" "vpc" {
  peer_vpc_id = "${aws_vpc.vpc.id}"
  vpc_id      = "${aws_vpc.vpc.id}"
  auto_accept = true

  accepter {
    allow_remote_vpc_dns_resolution = true
  }

  requester {
    allow_remote_vpc_dns_resolution = true
  }

  tags {
    Name = "VPC Peering between ${var.vpc_cidr_prefix}-vpc and ${var.vpc_cidr_prefix}-vpc"
  }
}

resource "aws_vpc_peering_connection" "vpc1_3" {
  peer_vpc_id = "${aws_vpc.vpc.id}"
  vpc_id      = "${aws_vpc.vpc.id}"
  auto_accept = true

  accepter {
    allow_remote_vpc_dns_resolution = true
  }

  requester {
    allow_remote_vpc_dns_resolution = true
  }

  tags {
    Name = "VPC Peering between ${var.vpc_cidr_prefix}-vpc and ${var.vpc_cidr_prefix}-vpc"
  }
}
