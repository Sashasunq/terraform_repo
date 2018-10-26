output "vpc_id" {
  value = ["${aws_vpc.vpc.id}"]
}

output "region" {
  value = ["${aws_region}"]
}
