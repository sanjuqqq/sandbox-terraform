# Generating a random string to create a unique S3 bucket
resource "random_pet" "lambda_bucket_name" {
    prefix = "lambda"
    length = 2
}

# Creating S3 Bucket to store lamdba source code (zip archives)
resource "aws_s3_bucket" "lambda_bucket" {
    bucket = random_pet.lambda_bucket_name.id
    force_destroy = true
}

# Disable public access

resource "aws_s3_bucket_public_access_block" "lambda_bucket" {
    bucket = aws_s3_bucket.lambda_bucket.id

    block_public_acls = true
    block_public_policy = true
    ignore_public_acls = true
    restrict_public_buckets = true
}