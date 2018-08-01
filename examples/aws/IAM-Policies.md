# AWS IAM objects Needed on PTFE EC2 instances

## To allow AWS to assume role against the instance
Note that this is usually present on any EC2 instance

{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow"
    }
  ]
}

## To allow EC2 instances access to S3 bucket.
statement {
  sid    = "AllowS3"
  effect = "Allow"

  resources = [
    "arn:aws:s3:::<ptfe_bucket>",
    "arn:aws:s3:::<ptfe_bucket>/*",
  ]

  actions = [
    "s3:*",
  ]
}
