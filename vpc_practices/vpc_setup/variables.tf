variable "aws_region" {
  default = "eu-west-3"
}

# Production

variable "vpc_master_cidr" {
  description = "CIDR for the prod VPC"
  default     = "172.32.0.0/16"
}

variable "vpc_master_cidr_region_a" {
  default = "172.32.0.0/24"
}

variable "vpc_master_cidr_region_b" {
  default = "172.32.1.0/24"
}

variable "vpc_master_cidr_region_c" {
  default = "172.32.2.0/24"
}
