# DigitalOcean Kubernetes Challenge - Crossplane

This repository was created as a part of completing the Digital Ocean
[Kubernetes Challenge](https://www.digitalocean.com/community/pages/kubernetes-challenge).

## Main and secondary goals

I've chosen the Crossplane challenge, the description simply reads

 > Install Crossplane, which is like Terraform but you manage the infra from
 > inside Kubernetes, not from outside. Crossplane is an open source Kubernetes
 > add-on that enables platform teams to assemble infrastructure from multiple
 > vendors, and expose higher level self-service APIs for application teams to
 > consume, without having to write any code.

As as secondary goal I also want to

* Provision infrastructure as much as possible with [Terraform](https://www.terraform.io/)
* Handle the cluster via [Flux](https://fluxcd.io/) in
* Install something that could potentially be a fully production ready setup.

## Approach

We will need a functional Kubernetes cluster in order to install and use Crossplane.
To keep to the sub-goal of setting things up "for real" I've chosen to follow
[Chapter 15 of Kubernetes-Starter-Kit-Developers](https://github.com/digitalocean/Kubernetes-Starter-Kit-Developers/tree/main/15-automate-with-terraform-flux)
which sets up a fully production-ready cluster and even uses Flux.

With the cluster up and running, we'll configure Crossplane, and provision
something.

## Installing the cluster

This is more or less just a question of following [Chapter 15 of Kubernetes-Starter-Kit-Developers](https://github.com/digitalocean/Kubernetes-Starter-Kit-Developers/tree/main/15-automate-with-terraform-flux)
with a couple of modifications.

I've documented the places I deviate below:

1. Setup the required [prerequisites](https://github.com/digitalocean/Kubernetes-Starter-Kit-Developers/tree/main/15-automate-with-terraform-flux#prerequisites),
   with the following tweaks
   1. Don't create the Flux CD repo, we'll do that with Terraform
   2. Add the various tokens and keys the guide instruction to create to
      `creds.env` (use `dist-creds.env` as a template).
   3. Only create the space for the terraform state, all other (Loki, Velero)
      are created via Terraform.
2. do a `source credentials.env` before using Terraform.
3. Go through the guide - take extra care in the following steps
   1. When provisioning Loki, remember to edit the `HelmRelease` and insert the
      endpoints and keys for the aws `storage_config`. Use the spaces key/secret
      from `init.env` and get the bucket name and endpoint from `terraform output`
   2. Same goes for the Velero installation

## Evaluation

All in all the everything worked out. There are a number of areas that could be
improved, in particular if this setup is to be used for a real production setup:

1. All credentials are currently kept in the developers checkout of the repository.
   These credentials should be placed somewhere safe that could be accessed by
   other team-members. Digital Ocean does not have a key vault/key store product.
   An alternative would be to check encrypted credentials in to the GitHub repo,
   or adding all credentials as secrets to the cluster and run them via actions.
   There are plenty of products to choose between.
2.- I could have used separate spaces access/secret keys for everything, but to
  keep everything simple I've opted for just reusing the same key. Should one wish
  to use this setup for real, separate keys should be introduced. The same key is
  currently used by

    * By Terraform to access it's state
    * By Terraform to create buckets for Loki and Velero
    * By Loki and Velero to write their data
