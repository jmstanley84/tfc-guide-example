resource "aws_instance" "example" {
  ami           = "ami-830c94e3"
  instance_type = "m4.xlarge"
}