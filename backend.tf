terraform {
  backend "s3" {
    encrypt = true                                      //encrypts data
    bucket = "rb-wp-remote-state"       //name of s3 bucket
    region = "eu-central-1"                                //region
    key = "rb-wp-remote.tfstate"                //name of tfstate file
    dynamodb_table = "terraform-state-lock"               //dynamoDB table for state locking
  }
}