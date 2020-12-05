resource "google_compute_instance" "master" {
    count = var.master_count
    name         = format("master%s", count.index)

    machine_type = "n1-standard-1"
    zone         = format("%s-a", var.project_region)

    tags = ["kubernetes", "master"]

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

resource "google_compute_firewall" "master" {
  name    = format("%s-master", var.project_name)
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

  target_tags = ["master"]
}