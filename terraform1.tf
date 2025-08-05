terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.7.0"
    }
  }

  backend "s3"{
    bucket = "suyashdahitule-s3-bucket"
    key = "terraform.tfstate"
    region = "eu-west-1"
    dynamodb_table = "suyash-dynamodb-table"

    }


}
