terraform {
  backend "s3" {
    bucket = "dineshterraform-state"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
  }
}
