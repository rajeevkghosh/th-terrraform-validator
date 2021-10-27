provider "google" {
    credentials = file("../key.json")
    project = "dc-telus-playground"
}

resource "google_storage_bucket" "tf-validator-demo-bucket" {  
  name          = "tf-validator-demo-bucket"
  location      = "US"
  project = "dc-telus-playground"
  force_destroy = true
  lifecycle_rule {
    condition {
      age = "3"
    }
    action {
      type = "Delete"
    }
  }
}