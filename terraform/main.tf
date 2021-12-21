module "doks_flux_cd" {
  source = "github.com/digitalocean/container-blueprints/create-doks-with-terraform-flux"

  # DOKS
  do_api_token        = var.do_api_token # DO API TOKEN (string value)
  doks_cluster_name   = "cluster01"      # Name of this `DOKS` cluster ? (string value)
  doks_cluster_region = "fra1"           # What region should this `DOKS` cluster be provisioned in ? (string value)
  # Find this via doctl kubernetes options versions
  doks_cluster_version         = "1.21.5-do.0" # What Kubernetes version should this `DOKS` cluster use ? (string value)
  doks_cluster_pool_size       = "s-2vcpu-2gb" # What machine type to use for this `DOKS` cluster ? (string value)
  doks_cluster_pool_node_count = 2             # How many worker nodes this `DOKS` cluster should have ? (integer value)

  # GitHub
  # Important notes:
  #  - This module expects your Git `repository` and `branch` to be created beforehand
  #  - Currently, the `github_token` doesn't work with SSO
  github_user              = "danquah"                   # Your `GitHub` username
  github_token             = var.github_token            # Your `GitHub` personal access token
  git_repository_name      = github_repository.flux.name # Git repository where `Flux CD` manifests should be stored
  git_repository_branch    = "main"                      # Branch name to use for this `Git` repository (e.g.: `main`)
  git_repository_sync_path = "clusters/cluster01"        # Git repository path where the manifests to sync are committed (e.g.: `clusters/dev`)
}
