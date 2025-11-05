terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
  required_version = ">= 1.9.0"
}

provider "google" {
  project = "cicd-devops-ankita"
  region  = "us-central1"
  zone    = "us-central1-c"
}


