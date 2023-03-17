#módulo para la creación de instancias
module "ec2_cluster" {
  source                 = "./modules"
  version                = "~> 2.0"
 
  name                   = "cluster-rgb-test"
  instance_count         = 2
 
  ami                    = "ami-0b5eea76982371e91"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [module.ssh-security-group-rgb-test.this_security_group_id]
  subnet_ids = module.vpc.private_subnets
 
  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
 
module "ssh_security_group-rgb-test" {
  source  = "./modules"
  version = "~> 3.0"
 
  name = "ssh-server"
    description = "Security group for ssh-server with ssh ports open within VPC"
    vpc_id = module.vpc.vpc_id
 
    ingress_cidr_blocks = ["10.10.0.0/16"]
}