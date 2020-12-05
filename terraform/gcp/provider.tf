provider "google" {
  credentials   = file("./serviceaccount.json")
  region        = var.project_region
  project       = var.gcp_project_name
}