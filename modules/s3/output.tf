#OUTPUT RECURSO S3
output "s3_bucket_id" {
  value = [aws_s3_bucket.s3-bucket-rgb-test[*].id]
}
output "s3_bucket_arn" {
  value = [aws_s3_bucket.s3-bucket-rgb-test[*].arn]
}