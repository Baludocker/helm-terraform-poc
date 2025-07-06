variable "project_id" {
  description = "Your Google Cloud Project ID."
  type        = string
  # default     = "your-gcp-project-id" # Uncomment and replace if you want a default
}

variable "region" {
  description = "The GCP region for the GKE cluster and network."
  type        = string
  #default     = "us-east1"
}

variable "vpc_network_name" {
  description = "The name of the existing VPC network."
  type        = string
  #default     = "vpcnw"
}

variable "pub_subnet_name" {
  description = "The name of the existing public subnetwork within the VPC."
  type        = string
  #default     = "pub-1"
}
