include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../module//ec2_instance"
}

inputs = {
  instance_type = "t2.micro"
  instance_name = "example-server-DEV"
}
