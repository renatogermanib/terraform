#DEFINIENDO PROVIDER
provider "aws"{
  region     = local.region
  #access_key = "own_access_key"
  #secret_key = "own_secret_key"

  #todos los recursos que despliegue en aws tendrán los tags:
  default_tags {
    tags = local.tags
  }

}

#DEFINICIÓN DE CANTIDAD DE BUCKETS
locals {
  sb_number = ["1", "2", "3"]
}

#MÓDULO TERRAFORM PARA CREAR BUCKET S3
module "s3" {
  source      = "./modules/s3"
  region      = local.region
  bucket_name = "s3-${local.region}-${local.environment}-${local.sb_number[count.index]}"
  count       = length(local.sb_number)
  tags        = {
    Name = "s3-${local.region}-${local.environment}-${local.sb_number[count.index]}"
  }
}

output "s3_bucket_id" {
  value = module.s3[*].s3_bucket_id
}

output "s3_bucket_arn" {
  value = module.s3[*].s3_bucket_arn
}