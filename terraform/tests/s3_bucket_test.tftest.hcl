# tests/s3_bucket.tftest.hcl
run "verify_s3_bucket_exists" {
  command = apply
  
  assert {
    condition     = aws_s3_bucket.secure_bucket.bucket != ""
    error_message = "S3 bucket was not created successfully"
  }
}

run "verify_s3_bucket_encryption" {
  command = apply
  
  assert {
    condition     = aws_s3_bucket_server_side_encryption_configuration.secure_bucket.rule[0].apply_server_side_encryption_by_default[0].sse_algorithm == "AES256"
    error_message = "S3 bucket does not have AES256 encryption enabled"
  }
}

run "verify_s3_bucket_not_public" {
  command = apply
  
  assert {
    condition     = aws_s3_bucket_public_access_block.secure_bucket.block_public_acls == true
    error_message = "S3 bucket public ACLs are not properly blocked"
  }
  
  assert {
    condition     = aws_s3_bucket_public_access_block.secure_bucket.block_public_policy == true
    error_message = "S3 bucket public policy is not properly blocked"
  }
  
  assert {
    condition     = aws_s3_bucket_public_access_block.secure_bucket.ignore_public_acls == true
    error_message = "S3 bucket is not set to ignore public ACLs"
  }
  
  assert {
    condition     = aws_s3_bucket_public_access_block.secure_bucket.restrict_public_buckets == true
    error_message = "S3 bucket is not set to restrict public buckets"
  }
}
