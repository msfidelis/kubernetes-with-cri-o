  
resource "google_compute_network" "vpc_network" {
  name                    = format("%s-network", var.project_name)
  auto_create_subnetworks = "false"
  routing_mode            = var.network_routing_mode
}

resource "google_compute_subnetwork" "private_subnet1a" {
  name          =  format("private-subnet-%sa", var.project_region)
  ip_cidr_range = var.private_subnet_1a
  network       = google_compute_network.vpc_network.self_link
  region        = var.project_region
}


resource "google_compute_subnetwork" "private_subnet1b" {
  name          =  format("private-subnet-%sb", var.project_region)
  ip_cidr_range = var.private_subnet_1b
  network       = google_compute_network.vpc_network.self_link
  region        = var.project_region
}

resource "google_compute_subnetwork" "public_subnet1a" {
  name          =  format("public-subnet-%sa", var.project_region)
  ip_cidr_range = var.public_subnet_1a
  network       = google_compute_network.vpc_network.self_link
  region        = var.project_region
}

resource "google_compute_subnetwork" "public_subnet1b" {
  name          =  format("public-subnet-%sb", var.project_region)
  ip_cidr_range = var.public_subnet_1b
  network       = google_compute_network.vpc_network.self_link
  region        = var.project_region
}