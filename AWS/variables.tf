variable "bucket_names" {
  description = "List of S3 bucket names"
  type        = list(string)
  default = [ "raw", "trusted", "client" ]
}

variable "lambda_role_arn" {
  description = "ARN of the IAM role for Lambda function"
  type        = string
  default     = ""
}