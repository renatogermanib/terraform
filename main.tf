#definiendo provider
provider "aws"{
  region     = "us-east-1"
  #access_key = "own_access_key"
  #secret_key = "own_secret_key"
}

resource "aws_s3_bucket" "primero"{
  bucket = "bucket-lab-tf-1"

  tags = {
    Name = "Mi primer bucket"
    Environment = "Dev"
    }
}

resource "aws_s3_bucket_acl" "ejemplo-acl" {
  bucket = aws_s3_bucket.primero.id
  acl    = "private"
}