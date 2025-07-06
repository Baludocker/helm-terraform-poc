output "instance_name" {
  description = "The name of the deployed Rocky Linux instance."
  value       = google_compute_instance.rocky_linux_instance.name
}

output "instance_ip" {
  description = "The public IP address of the deployed Rocky Linux instance."
  value       = google_compute_instance.rocky_linux_instance.network_interface[0].access_config[0].nat_ip
}

output "instance_zone" {
  description = "The zone of the deployed Rocky Linux instance."
  value       = google_compute_instance.rocky_linux_instance.zone
}
