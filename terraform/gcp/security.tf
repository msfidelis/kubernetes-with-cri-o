resource "google_compute_firewall" "kubernetes" {
  name    = format("%s-kubernetes", var.project_name)
  network = google_compute_network.vpc_network.self_link

  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }

  allow {
    protocol = "udp"
    ports    = ["0-65535"]
  }

  source_ranges =   [ "10.0.0.0/8" ]
  target_tags   =   [ "kubernetes" ]
}