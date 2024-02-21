resource "google_storage_bucket" "your-storage-resource-name" {
  name          = "your-bucket-name"
  location      = "US"
  force_destroy = true
  uniform_bucket_level_access = true
}