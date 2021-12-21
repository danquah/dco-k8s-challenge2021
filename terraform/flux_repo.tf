# Create a repository pr. site.
resource "github_repository" "flux" {
  name        = "dco-k8s-challenge2021-flux"
  description = "Repo for flux"
  visibility  = "private"
  auto_init   = true
}
