resource "google_compute_instance" "your-instance-resource-name1" {
  name         = "name of instance1" # as dispayed in cloud console
  machine_type = "e2-micro"
  boot_disk {
    initialize_params {
      image = "debian-11-bullseye-v20240213"
    }
  }

  network_interface {
    network = "default"
    access_config {
    }
  }
  metadata_startup_script = <<-EOT
        #!/bin/bash
    EOT
  allow_stopping_for_update = true
}
resource "google_compute_instance" "your-instance-resource-name2" {
  name         = "name of instance2"
  machine_type = "e2-micro"

  boot_disk {
    initialize_params {
      image = "debian-11-bullseye-v20240213"
    }
  }

  network_interface {
    network = "default"
  }
  metadata_startup_script = <<-EOT
        #!/bin/bash
    EOT
  allow_stopping_for_update = true
}
resource "google_compute_instance" your-instance-resource-name3" {
  name         = "name of instance3"
  machine_type = "es-standard-2"

  boot_disk {
    initialize_params {
      image = "debian-11-bullseye-v20240213"
    }
  }

  network_interface {
    network = "default"
  }
  
  allow_stopping_for_update = true
}