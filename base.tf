/* This is a multi-line comment. This is a multi-line comment. This is a multi-line comment. This is a multi-line comment. This is a multi-line comment. This “is a multi-line comment. */
# AWS profiles
provider "aws" {
  profile = "dev-gg"
  region = "us-west-1"
}

#provider "aws" {
#  access_key = ""
#  secret_key = ""
#  region     = "us-west-1"
#}

# This is a single-line comment.
resource "aws_instance" "base" {
  ami           = "ami-969ab1f6"
  instance_type = "t2.micro"
  subnet_id = "subnet-ae0sdfgsdf"
}

resource "aws_eip" "base" {
    instance = "${aws_instance.base.id}"
}
