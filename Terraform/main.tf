provider "aws" {
  version = "2.33.0"

  region = var.aws_region
}

resource "aws_instance" "basic" {
  ami           = "ami-0ee1a20d6b0c6a347"
  instance_type = "m4.xlarge"
}

provider "random" {
  version = "2.2"
}

resource "random_pet" "table_name" {}

resource "aws_dynamodb_table" "tfc_example_table" {
  name = "${var.db_table_name}-${random_pet.table_name.id}"

  read_capacity  = var.db_read_capacity
  write_capacity = var.db_write_capacity
  hash_key       = "UUID"

  attribute {
    name = "UUID"
    type = "S"
  }

  tags = {
    user_name = var.tag_user_name
  }
}
