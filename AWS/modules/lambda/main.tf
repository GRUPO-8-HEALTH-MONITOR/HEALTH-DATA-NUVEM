resource "aws_lambda_function" "this" {
  function_name = var.function_name
  handler       = var.handler
  runtime       = var.runtime
  role          = var.existing_role_arn
  filename      = var.filename
  source_code_hash = filebase64sha256(var.filename)

  environment {
    variables = {
      RAW_BUCKET_NAME = var.raw_bucket_name
    }
  }
}
