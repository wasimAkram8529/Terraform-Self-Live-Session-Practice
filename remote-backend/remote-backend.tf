terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket-for-collaboration"
    key            = "static-site/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}
