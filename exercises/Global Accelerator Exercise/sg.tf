module "sydney_http_ssh_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 5.0"

  name        = "HTTP_SSH_Permit_SG"
  description = "HTTP open to the internet, SSH only from ssh_ingress_cidr"
  vpc_id      = module.aws_sydney_vpc.vpc_id

  ingress_cidr_blocks      = ["0.0.0.0/0"]
  ingress_rules            = ["http-80-tcp"]
  ingress_with_cidr_blocks = [{ rule = "ssh-tcp", cidr_blocks = var.ssh_ingress_cidr }]
  egress_rules             = ["all-all"]
}

module "sao_paulo_http_ssh_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 5.0"

  name        = "HTTP_SSH_Permit_SG"
  description = "HTTP open to the internet, SSH only from ssh_ingress_cidr"
  vpc_id      = module.aws_sao_paulo_vpc.vpc_id

  ingress_cidr_blocks      = ["0.0.0.0/0"]
  ingress_rules            = ["http-80-tcp"]
  ingress_with_cidr_blocks = [{ rule = "ssh-tcp", cidr_blocks = var.ssh_ingress_cidr }]
  egress_rules             = ["all-all"]
}

module "seoul_http_ssh_sg" {
  source                   = "terraform-aws-modules/security-group/aws"
  version                  = "~> 5.0"
  name                     = "HTTP_SSH_Permit_SG"
  description              = "HTTP open to the internet, SSH only from ssh_ingress_cidr"
  vpc_id                   = module.aws_seoul_vpc.vpc_id
  ingress_cidr_blocks      = ["0.0.0.0/0"]
  ingress_rules            = ["http-80-tcp"]
  ingress_with_cidr_blocks = [{ rule = "ssh-tcp", cidr_blocks = var.ssh_ingress_cidr }]
  egress_rules             = ["all-all"]
}