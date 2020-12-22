resource "aws_vpc" "cluster_vpc" {
    cidr_block = "12.0.0.0/16"
    enable_dns_support = true
    enable_dns_hostnames = true
    tags = merge(var.tags, { Name = format("%s-vpc", var.project_name) })
}