module "aws_sydney_vpc" {
  source    = "terraform-aws-modules/vpc/aws"
  version   = "~> 5.0"
  providers = { aws = aws.sydney }

  name = "SYDNEY-VPC"
  cidr = "10.0.0.0/16"

  azs            = ["ap-southeast-2a", "ap-southeast-2c"]
  public_subnets = ["10.0.0.0/24", "10.0.1.0/24"]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

module "aws_sao_paulo_vpc" {
  source    = "terraform-aws-modules/vpc/aws"
  version   = "~> 5.0"
  providers = { aws = aws.sao_paulo }

  name           = "SAOPAULO-VPC"
  cidr           = "10.0.0.0/16"
  azs            = ["sa-east-1a", "sa-east-1c"]
  public_subnets = ["10.0.0.0/24", "10.0.1.0/24"]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

module "aws_seoul_vpc" {
  source         = "terraform-aws-modules/vpc/aws"
  version        = "~> 5.0"
  providers      = { aws = aws.seoul }
  name           = "SEOUL-VPC"
  cidr           = "10.0.0.0/16"
  azs            = ["ap-northeast-2a"]
  public_subnets = ["10.0.0.0/24"]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}