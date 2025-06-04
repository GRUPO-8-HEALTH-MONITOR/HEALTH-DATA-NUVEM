module "vpc" {
  source       = "./modules/vpc"
  vpc_cidr     = "10.0.0.0/16"
  subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
}

module "ec2" {
  source    = "./modules/ec2"
  subnet_id = module.vpc.subnet_ids[0]
  vpc_id    = module.vpc.vpc_id
}

module "s3" {
  source = "./modules/s3"
  bucket_names = var.bucket_names
}

module "lambda_function" {
  source = "./modules/lambda"

  function_name     = "health-data-lambda-G8"
  handler           = "python_function.handler"
  runtime           = "python3.11"
  filename          = "${path.module}/modules/lambda/lambda.zip"
  existing_role_arn = "arn:aws:iam::654654300188:role/LabRole"
  raw_bucket_name   = module.s3.s3_raw_name
}

module "api_gateway" {
  source     = "./modules/api-gateway"
  api_name   = "api-gateway-health-data-G8"
  lambda_arn = module.lambda_function.lambda_arn
}
