# For more details about aws_s3_buckets see:
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket

resource "aws_s3_bucket" "my_bucket" {
  bucket_prefix = "my-test-with-terraform-"
  acl           = "public-read"

  # disable non-supported features on OOS
  skip_acceleration_config = true
  skip_payer_config        = true
  skip_lock_config         = true
  skip_logging_config      = true
  skip_tag_config          = true
  skip_encryption_config   = true
}

resource "aws_s3_bucket" "my_bucket2" {
  bucket_prefix = "my-test-with-terraform2-"
  acl           = "public-read"

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["PUT", "POST"]
    allowed_origins = ["https://s3-website-test.hashicorp.com"]
    expose_headers  = ["ETag"]
    max_age_seconds = 3000
  }

  # disable non-supported features on OOS
  skip_acceleration_config = true
  skip_payer_config        = true
  skip_lock_config         = true
  skip_logging_config      = true
  skip_tag_config          = true
  skip_encryption_config   = true
}
