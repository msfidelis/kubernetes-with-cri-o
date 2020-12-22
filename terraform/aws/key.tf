resource "aws_key_pair" "cluster_key" {
    key_name = format("%s-key", var.project_name)
    public_key = file(var.aws_key_path)
    tags = var.tags
}