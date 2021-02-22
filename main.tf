module "ec2" {
    source        = "./ec2"
    instance_type = "t3.micro"
}

output "public_dns" {
    value = module.ec2.public_dns
}
