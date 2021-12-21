resource "digitalocean_spaces_bucket" "velero" {
  name   = "velero01-mda-dco-k8s-challenge2021"
  region = "fra1"
}
