resource "aws_s3_bucket" "staging_terraform_state" {
    bucket = "staging-terraform-state"
    versioning {
      enabled = true
  }
  lifecycle {
      prevent_destroy = true
  }
}
