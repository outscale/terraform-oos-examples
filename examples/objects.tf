# Fore more details about s3_bucket_object see:
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_object

resource "aws_s3_bucket_object" "my_object" {
  bucket = aws_s3_bucket.my_bucket.id
  key    = "my_object_name"
  source = "my-file.data"
}
