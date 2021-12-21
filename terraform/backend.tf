# Store the state file using a DO Spaces bucket
terraform {
  backend "s3" {
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    endpoint                    = "fra1.digitaloceanspaces.com"
    region                      = "us-east-1"                    # leave this as is (Terraform expects the AWS format - N/A for DO Spaces)
    bucket                      = "tf-mda-dco-k8s-challenge2021" # replace this with your bucket name
    key                         = "terraform.tfstate"            # replaces this with your state file name (e.g. terraform.tfstate)
  }
}

