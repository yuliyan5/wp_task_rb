#Bastion SG

resource "aws_security_group_rule" "ssh_ingress" {
  security_group_id = module.vpc.bastion_security_group_id
  type              = "ingress"
  from_port         = 2222
  to_port           = 2222
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}