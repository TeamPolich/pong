provider "aws" {
  region = "${var.aws_region}"
}

resource "aws_s3_bucket" "polich-games" {
  bucket = "polich-games"
  acl    = "public-read"
  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET"]
    allowed_origins = ["*"]
    expose_headers  = ["ETag"]
    max_age_seconds = 3
  }
  tags = {
    Application = "polich_games"
    Environment = "prod"
  }
}

output "asset_bucket" {
  value = "${aws_s3_bucket.polich-games.id}"
}
