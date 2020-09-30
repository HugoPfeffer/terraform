# Using a single workspace:
terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "hpfefferlabs"

    workspaces {
      name = "aws-hpfefferlabs"
    }
  }
}
