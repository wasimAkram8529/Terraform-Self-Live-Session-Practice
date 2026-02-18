provider "aws" {
  region = "us-east-1"
}

module "s3" {
  source = "./s3"
}
# module "vpc" {
#   source = "./vpc"
# }

# module "sg" {
#   source = "./sg"
#   vpc_id = module.vpc.vpc_id
# }

# module "ec2" {
#   count = 2
#   source = "./ec2"
#   sg = module.sg.ec2-sg-id
#   subnet = module.vpc.subnets[count.index]
#   tag = "web-server-${count.index}"
# }

# module "alb" {
#   source = "./alb"
#   alb-sg = module.sg.alb-sg-id
#   subnets = module.vpc.subnets
#   vpc_id = module.vpc.vpc_id
#   instance_ids = [module.ec2[0].instance_id, module.ec2[1].instance_id]
# }