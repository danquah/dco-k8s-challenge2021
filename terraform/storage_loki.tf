resource "digitalocean_spaces_bucket" "loki" {
  name   = "loki01-mda-dco-k8s-challenge2021"
  region = "fra1"
}
