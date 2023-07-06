include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../modules//ec2_instance"
}

inputs = {
  instance_type = "t2.large"
  instance_name = "example-server-STAGE"
}