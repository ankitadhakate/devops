variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "region" {
  description = "Region for the GKE cluster"
  type        = string
  default     = "us-central1"
}

variable "cluster_name" {
  description = "The name of the GKE cluster"
  type        = string
  default     = "demo-gke-cluster"
}

variable "node_count" {
  description = "Number of nodes in the default node pool"
  type        = number
  default     = 3
}

variable "machine_type" {
  description = "Machine type for GKE nodes"
  type        = string
  default     = "e2-medium"
}

variable "environment" {
  description = "Environment label (e.g., dev, staging, prod)"
  type        = string
  default     = "dev"
}
