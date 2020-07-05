resource "aws_iam_instance_profile" "db_instance" {
  name = "db_instance"
  role = aws_iam_role.db-s3-role.name
}


resource "aws_iam_role" "db-s3-role" {
  name = "db_instance_role"
  path = "/"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}



resource "aws_iam_role_policy_attachment" "s3-read-only-access" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
  role       = aws_iam_role.db-s3-role.name
}