terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
  backend "gcs" {
    bucket  = "your-bucket-name"
    prefix  = "terraform/state"
  }
}
provider "google" {
  credentials = file("<YOUR-CREDENTIALS-FILE>.json")  # Path to your service account key file
  project     = var.project_id  # Reference to the project_id variable
  region      = var.region      # Reference to the region variable
  zone        = var.zone        # Reference to the zone variable
}
module "instances" {
  source = "./modules/instances"

  # Variables required by the module, these should match the variables defined in the module
  project_id = var.project_id
  region     = var.region
  zone       = var.zone
}
module "storage" {
  source = "./modules/storage"

  # Variables required by the module, these should match the variables defined in the module
  project_id = var.project_id
  region     = var.region
  zone       = var.zone
}
module "vpc" {
    source  = "terraform-google-modules/network/google"
    version = "~> 6.0"

    project_id   = var.project_id
    network_name = "your-vpc-name"
    routing_mode = "GLOBAL"

    subnets = [
        {
            subnet_name           = "subnet-01"
            subnet_ip             = "10.10.10.0/24"
            subnet_region         = "us-west1"
        },
        {
            subnet_name           = "subnet-02"
            subnet_ip             = "10.10.20.0/24"
            subnet_region         = "us-west1"
        },
    ]
}
