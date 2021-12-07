module "ec2_instaces" {
    source = "./modules/aws-istance"
    instance_count = var.instance_count
}