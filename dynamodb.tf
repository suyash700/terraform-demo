resource "aws_dynamodb_table" "my_dynamodb_table" {
  name           = "suyash-dynamodb-table"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"


  attribute {
    name = "LockID"
    type = "S"
  }



  tags = {
    Name        = "suyash-dynamodb-table"
  }
}
