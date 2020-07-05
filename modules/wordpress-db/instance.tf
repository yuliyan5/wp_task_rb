resource "aws_instance" "db" {
  ami           = var.image_id
  instance_type = var.instance_type
  vpc_security_group_ids  = ["${aws_security_group.db.id}"]
  subnet_id = var.vpc_private_subnets[0]
  key_name = var.key_name
  user_data = file("configuration/db_userdata.sh")
  iam_instance_profile = aws_iam_instance_profile.db_instance.name


  tags = {
    Name        = "wp-db"
  }
}



