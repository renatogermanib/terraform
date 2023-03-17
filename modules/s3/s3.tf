#RECURSO S3
/*
provider "aws"{
  region     = var.region
  #access_key = "own_access_key"
  #secret_key = "own_secret_key"
}
*/

resource "aws_s3_bucket" "s3-bucket-rgb-test" {
  bucket = var.bucket_name # IMPORTANT! Conflict with bucket_prefix
  #bucket_prefix = var.bucket_prefix # IMPORTANT! Conflict with bucket
  # TAGs of Resources
  tags = var.tags
}

resource "aws_s3_bucket_acl" "s3-bucket-acl-rgb-test" {
  bucket = aws_s3_bucket.s3-bucket-rgb-test.id
  acl    = "private"
}


resource "aws_s3_bucket_versioning" "versionamiento-rgb-test" {
  bucket = aws_s3_bucket.s3-bucket-rgb-test.id
  versioning_configuration {
    status = "Enabled"
  }
}

#BLOQUEA ACCESO PÚBLICO - PERMITE ACCESO SOLO DESDE RED INTERNA
resource "aws_s3_bucket_public_access_block" "s3-bucket-aclblock-rgb-test" {
  bucket = aws_s3_bucket.s3-bucket-rgb-test.id
  block_public_acls   = var.block_public_acls
  block_public_policy = var.block_public_policy
  restrict_public_buckets = true
  ignore_public_acls = true
}