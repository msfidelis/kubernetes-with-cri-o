resource "aws_instance" "master" {

    ami = var.ami
    instance_type = var.kubernetes_master_instance_type

    subnet_id = aws_subnet.public_subnet_a.id
    associate_public_ip_address = true

    vpc_security_group_ids = [ 
        aws_security_group.kubernetes.id
    ]
    user_data     = templatefile("${path.module}/userdata.sh", {
        hostname  = format("k8s-master")
    })
    key_name = aws_key_pair.cluster_key.key_name

    tags = merge(var.tags, { 
        Name = format("k8s-master")
    })

}