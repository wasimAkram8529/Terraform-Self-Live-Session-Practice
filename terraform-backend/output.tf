output "bucket_name" {
  description = "Name of the Bucket"
  value= aws_s3_bucket.remote_backend.bucket
}

output "bucket_arn" {
  description = "Bucket ARN"
  value = aws_s3_bucket.remote_backend.arn
}