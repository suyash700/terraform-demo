resource "aws_s3_bucket" "my_bucket" {
  bucket = "suyashdahitule-s3-bucket"

  tags = {
    Name        = "suyashdahitule-s3-bucket"

  }
}
