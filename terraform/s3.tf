provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "vprofile_bucket" {
  bucket = "vprofile2025-demo" // Change to a unique bucket name

  tags = {
    Name        = "vprofile2025-demo"
    Environment = "dev"
  }
}

output "bucket_name" {
  value = aws_s3_bucket.vprofile_bucket.bucket
}