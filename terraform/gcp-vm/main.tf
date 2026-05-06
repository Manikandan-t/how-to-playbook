terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}

provider "google" {
  project = var.project_id
  zone    = var.zone
}

resource "google_compute_instance" "gpu_vm" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone

  tags = ["http-server"]

  labels = {
    source = "terraform"
  }

  scheduling {
    provisioning_model           = "STANDARD"
    automatic_restart            = true
    on_host_maintenance          = "TERMINATE"
  }

  # Boot disk
  boot_disk {
    initialize_params {
      image = var.image
      size  = var.disk_size
      type  = "pd-balanced"
    }
  }

  # Network
  network_interface {
    network = "default"
    access_config {} # Enables external IP
  }

  # GPU
  guest_accelerator {
    type  = "nvidia-l4"
    count = 1
  }

  # Service account
  service_account {
    email  = var.service_account
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }

  # Metadata (optional: auto-install drivers)
  metadata = {
    install-nvidia-driver = "true"
  }

  shielded_instance_config {
    enable_secure_boot          = false
    enable_vtpm                 = true
    enable_integrity_monitoring = true
  }
}