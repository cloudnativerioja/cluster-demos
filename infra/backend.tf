terraform {
  backend "s3" {
    bucket = "tf-state-remote-civo"
    key    = "terraform-state/demo-civo.tfstate"
    region = "us-east-1"
  }

  required_providers {
    civo = {
      source  = "civo/civo"
      version = "1.0.31"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.10.1"
    }
  }
}