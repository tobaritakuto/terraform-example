module "vpc" {
  source        = "./vpc"  
}

module "ec2" {
  source        = "./ec2"
  instance_type = "t3.micro"
  vpc_id        = module.vpc.vpc_id
  subnet_id     = module.vpc.public_subnet_id
}

output "public_dns" {
  value = module.ec2.public_dns
}
