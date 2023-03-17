#módulo para la creación de vpc
module "vpc" {
  source = "./modules"
 
  name = "my-vpc-rgb-test"
  cidr = "10.0.0.0/16"
 
  azs             = ["us-east-1"] #availability zones
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"] #2 private subnets
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"] #2 public subnets
 
  enable_nat_gateway = true
 
  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}