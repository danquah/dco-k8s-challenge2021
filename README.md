# dco-k8s-challenge2021

DigitalOcean Kubernetes Challenge

Based on [Chapter 15 of Kubernetes-Starter-Kit-Developers](https://github.com/digitalocean/Kubernetes-Starter-Kit-Developers/tree/main/15-automate-with-terraform-flux)


## Boostrapping

1. Setup the required [prerequisites](https://github.com/digitalocean/Kubernetes-Starter-Kit-Developers/tree/main/15-automate-with-terraform-flux#prerequisites) - skip the creation of the flux
   github repo and creation of any other buckets than the tf state bucket. We're
   provisioning as much as possible via TF
2. Provision blob storage for TF manually
3. Copy all `dist-*` files stripping off the `dist-` part of the filename and
   customize them.
4. do a `source init.env` before using Terraform.
5. Go through the guide - take extra care in the following steps
   1. When provisioning Loki, remember to edit the `HelmRelease` and insert the
      endpoints and keys for the aws `storage_config`. Use the spaces key/secret
      from `init.env` and get the bucket name and endpoint from `terraform output`

## Notes
- The `init.env` has to be sourced (`source init.env`) prior to doing anything with TF
- I've create a single spaces access/secret key and added it as both the key TF
  uses to access it's state, and the one TF uses to create the other buckets
  we'll need for workloads running inside the cluster (eg. Loki)
- I've used the exact same key to pass on to loki. Again, this is a bit lazy as
  I should have create separate keys for everything - but hey, we're just playing
  around here.
