terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 4.0"
    }
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.10.1"
    }
  }
}
# Configure the GitHub Provider
provider "github" {}

provider "digitalocean" {
  token = var.do_api_token
}
