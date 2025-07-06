# Configure the Google Cloud provider
provider "google" {
  project = var.project_id
  region  = var.region
}

# -----------------------------------------------------------------------------
# Terraform State Backend Configuration
# -----------------------------------------------------------------------------
terraform {
  backend "gcs" {
    bucket  = "poc-terraformt" # Your bucket name
    prefix  = "compute-instance-state" # Changed prefix for instance
  }
}

# -----------------------------------------------------------------------------
# Data Sources for Existing Network and Subnet (Revised for robustness)
# -----------------------------------------------------------------------------

#  confirm the network if the subnet exists within it.
data "google_compute_subnetwork" "devops_pub_subnet" {
  name    = var.pub_subnet_name
  region  = var.region
  project = var.project_id
}

# Data source for latest Rocky Linux image
data "google_compute_image" "rocky_linux_latest" {
  family  = "rocky-linux-8" # Or "rocky-linux-9" for Rocky 9
  project = "rocky-linux-cloud" # Official Rocky Linux images project
}

# -----------------------------------------------------------------------------
# Compute Instance Deployment
# -----------------------------------------------------------------------------

resource "google_compute_instance" "rocky_linux_instance" {
  name         = "rocky-instance-01"
  machine_type = "e2-medium" # Or another suitable machine type
  zone         = "${var.region}-a" # Deploy to a specific zone within the region

  boot_disk {
    initialize_params {
      image = data.google_compute_image.rocky_linux_latest.self_link
    }
  }

  network_interface {
    subnetwork = data.google_compute_subnetwork.devops_pub_subnet.self_link
    access_config {
      # Ephemeral public IP
    }
  }

}

