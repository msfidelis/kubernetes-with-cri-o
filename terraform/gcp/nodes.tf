resource "google_compute_instance" "node" {
    count = var.node_count
    name         = format("node%s", count.index)

    machine_type = "n1-standard-1"
    zone         = format("%s-a", var.project_region)

    tags = ["kubernetes", "node"]

    boot_disk {
        initialize_params {
            image = "ubuntu-os-cloud/ubuntu-1804-lts"
            size  = var.disk_size
        }
    }

    metadata = {
        sshKeys = format("%s:%s", var.username, file(var.ssh_key)) 
    }    

    network_interface {
        network       = google_compute_network.vpc_network.self_link
        subnetwork = google_compute_subnetwork.public_subnet1a.name
        access_config {
        }
    }    
}

resource "google_compute_firewall" "node" {
  name    = format("%s-nodes", var.project_name)
  network = google_compute_network.vpc_network.self_link

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  allow {
    protocol = "tcp"
    ports    = ["443"]
  }    

  target_tags = ["node"]
}