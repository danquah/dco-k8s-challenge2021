output "loki_bucket_name" {
  description = "Name of the Loki spaces bucket name"
  value       = digitalocean_spaces_bucket.loki.name
}

output "loki_bucket_endpoint" {
  description = "S3 compatible endpoint for the bucket"
  value       = "${digitalocean_spaces_bucket.velero.region}.digitaloceanspaces.com"
}

output "loki_bucket_region" {
  description = "Bucket region"
  value       = digitalocean_spaces_bucket.loki.region
}

output "velero_bucket_name" {
  description = "Name of the Velero spaces bucket name"
  value       = digitalocean_spaces_bucket.velero.name
}

output "velero_bucket_endpoint" {
  description = "S3 compatible endpoint for the bucket"
  value       = "${digitalocean_spaces_bucket.velero.region}.digitaloceanspaces.com"
}

output "velero_bucket_region" {
  description = "Bucket region"
  value       = digitalocean_spaces_bucket.velero.region
}
