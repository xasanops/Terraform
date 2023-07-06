locals {
  parsed = regex(".*/(?P<env>.*?)/.*", get_terragrunt_dir())
  env    = local.parsed.env
}

remote_state {
  backend = "s3"
  config = {
    bucket = "terragrunt-xasan-bucket-${local.env}"
    region = "eu-west-2"
    key    = "${path_relative_to_include()}/terraform.tfstate"
  }

  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }

}