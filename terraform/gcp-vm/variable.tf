variable "project_id" {
  description = "GCP Project ID"
}

variable "zone" {
  description = "GCP zone"
  default     = "us-central1-b"
}

variable "instance_name" {
  default = "gcp-l4-vm"
}

variable "machine_type" {
  default = "g2-standard-8"
}

variable "image" {
  default = "projects/ubuntu-os-cloud/global/images/ubuntu-minimal-2604-resolute-amd64-v20260421"
}

variable "disk_size" {
  default = 50
}

variable "service_account" {
  description = "Service account email"
}