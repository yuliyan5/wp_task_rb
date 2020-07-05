# Application SG
resource "aws_security_group" "db" {
  vpc_id = var.vpc_id
  name = "${var.env}-db-sg"
  ingress {
    protocol  = -1
    self      = true
    from_port = 0
    to_port   = 0
    #description = "self traffic"
  }


  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    security_groups = [var.bastion_sg]
    description = "jump-host"
  }

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    security_groups = [var.wp_instance_security_group_id]
    description = "jump-host"
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}