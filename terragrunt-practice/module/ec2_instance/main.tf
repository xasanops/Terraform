resource "aws_instance" "main" {
  ami           = "ami-038056f5d3df2259d"
  instance_type = var.instance_type

  tags = {
    Name = "${var.instance_name}"
  }
}
