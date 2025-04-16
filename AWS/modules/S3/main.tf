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
    Name = "raw-bucket"
  }
}

resource "aws_s3_bucket" "trusted" {
  bucket = "trusted-bucket-${random_id.trusted_suffix.hex}"

  tags = {
    Name = "trusted-bucket"
  }
}

resource "aws_s3_bucket" "client" {
  bucket = "client-bucket-${random_id.client_suffix.hex}"

  tags = {
    Name = "client-bucket"
  }
}