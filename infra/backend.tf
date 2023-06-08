terraform {
#   backend "s3" {
#     bucket = "bucket-name"
#     key = "terraform-state/demo-civo.tfstate"
#     region  = "us-east-1"
#   }
backend "local" {
    path = "local.tfstate"
  }
  
  required_providers {
    civo = {
      source = "civo/civo"
      version = "1.0.31"
    }
  }
}