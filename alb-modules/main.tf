module "vpc" {
  source = "./vpc"
}

module "sg" {
  source = "./sg"
  vpc_id = module.vpc.vpc_id
}

module "ec2" {
  count = 2
  source = "./ec2"
  sg = module.sg.ec2_sg_id
  tag = "ubuntu-server-${count.index + 1}"
  subnet = module.vpc.subnets[count.index]
}

module "alb" {
  source = "./alb"
  alb_sg = module.sg.alb_sg_id
  subnet_ids = module.vpc.subnets
  vpc_id = module.vpc.vpc_id
  instance_ids = [module.ec2[0].ec2_instance_ids, module.ec2[1].ec2_instance_ids]
}