module "vpc" {
  source      = "./modules/vpc"
  vpc_cidr    = "10.0.0.0/16"
  subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
}

module "ec2" {
  source      = "./modules/ec2"
  subnet_id   = module.vpc.subnet_ids[0]
  vpc_id      = module.vpc.vpc_id
}

module "s3" {
  source      = "./modules/s3"
}

module "lambda_function" {
  source = "./modules/lambda"

  function_name = "example_lambda"
  handler       = "index.handler"
  runtime       = "python3.11"
  filename      = "${path.module}/modules/lambda/lambda.zip"
}
