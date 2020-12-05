variable "project_name" {
    default = "k8s"
}

variable "project_region" {
    default = "us-central1"
}

variable "gcp_project_name" {
    default = "cncf-280014"
}

variable "network_routing_mode" {
    description = "Routing mode for network; GLOBAL or REGIONAL"
    default     = "GLOBAL"
}

variable "public_subnet_1a" {
    default     = "10.26.1.0/24"
}

variable "public_subnet_1b" {
    default     = "10.26.2.0/24"
}

variable "private_subnet_1a" {
    default     = "10.26.3.0/24"
}

variable "private_subnet_1b" {
    default     = "10.26.4.0/24"
}

variable "master_count" {
    default = 1 
}

variable "node_count" {
    default = 2
}

variable "harbor_count" {
    default = 1
}

variable "envoy_count" {
    default = 1
}

variable "disk_size" {
    default = 10
}

variable "username" {
    default = "matheus"
}

variable "ssh_key" {
    default = "./cncf_key.pub"
}