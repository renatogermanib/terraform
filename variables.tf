#LOCALES Y VARIABLES (MAIN)
locals {
  region = "us-east-1"
  environment = "testing"
  creator = "Terraform"
  team = "IAC"
  entity = "SRE"

  tags = {
    Environment = local.environment
    Creator = local.creator
    Team = local.team
    Entity = local.entity
  }
}