variable "region" {
  description = "The region where GCP resources will be created"
  type        = string
  default     = "google-region" # e.g europe-west1
}

variable "zone" {
  description = "The zone within the region where GCP resources will be created"
  type        = string
  default     = "google-zone" # e.g. europe-west1-d
}

variable "project_id" {
  description = "The ID of the GCP project"
  type        = string
  default     = "your-project-id" 
}