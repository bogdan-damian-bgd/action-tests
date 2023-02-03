provider "aws" {
 region = "eu-central-1"
}

resource "aws_instance" "web" {
 ami           = "ami-00003c1d"
 instance_type = "t3.micro"

 tags = {
   Name = "my-instance"
 }
}
