# Application SG
resource "aws_security_group" "sg_main" {
  vpc_id = var.vpc_id
  name = "${var.env}-${var.application_name}-sg"
  ingress {
    protocol  = -1
    self      = true
    from_port = 0
    to_port   = 0
    #description = "self traffic"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "http port"
  }

    ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "https port"
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    security_groups = [var.bastion_sg]
    description = "jump-host"
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "applications-sg"
  }
}