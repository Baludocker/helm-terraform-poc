terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0" # Use an appropriate version for your needs
    }
  }
  required_version = ">= 1.0"
}
