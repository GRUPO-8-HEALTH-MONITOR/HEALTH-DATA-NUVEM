resource "random_id" "raw_suffix" {
  byte_length = 4
}

resource "random_id" "trusted_suffix" {
  byte_length = 4
}

resource "random_id" "client_suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "raw" {
  bucket = "raw-bucket-${random_id.raw_suffix.hex}"

  tags = {
    Name = var.bucket_names[0]
  }
}

resource "aws_s3_bucket" "trusted" {
  bucket = "trusted-bucket-${random_id.trusted_suffix.hex}"

  tags = {
    Name = var.bucket_names[1]
  }
}

resource "aws_s3_bucket" "client" {
  bucket = "client-bucket-${random_id.client_suffix.hex}"

  tags = {
    Name = var.bucket_names[2]
  }
}