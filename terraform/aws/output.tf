output "master_public_ip" {
  value = aws_instance.master.public_ip
}

output "nodes_public_ip" {
  value = aws_instance.nodes.*.public_ip
}