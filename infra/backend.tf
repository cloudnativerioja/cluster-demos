terraform {
  backend "s3" {
    bucket = "tf-state-remote-civo"
    key    = "terraform-state/demo-civo.tfstate"
    region = "us-east-1"
  }

  required_providers {
    civo = {
      source  = "civo/civo"
      version = "1.0.35"
    }
  }
}