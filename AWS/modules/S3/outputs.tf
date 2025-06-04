output "s3_raw_name" {
  value = aws_s3_bucket.raw.tags.Name
}
