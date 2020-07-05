resource "aws_launch_configuration" "wp" {
  name_prefix   = "${var.env}.${var.application_name}-"
  iam_instance_profile = aws_iam_instance_profile.wp_instance.name
  image_id      = var.image_id
  instance_type = var.instance_type
  user_data = file("configuration/ec2_userdata.sh")
  key_name = "yuli"
  security_groups = [aws_security_group.sg_main.id]

  root_block_device {
        encrypted             = true
  }

  lifecycle {
    create_before_destroy = true
  }
}



resource "aws_autoscaling_group" "application_asg" {
  name                 = "${var.env}-${var.application_name}-asg"
  launch_configuration = aws_launch_configuration.wp.name
  availability_zones   = [var.az-a, var.az-b]
  vpc_zone_identifier  = var.vpc_private_subnets
  desired_capacity = var.desired_capacity
  min_size         = var.min_size
  max_size         = var.max_size
  enabled_metrics  = var.enabled_metrics
  termination_policies = ["OldestLaunchConfiguration"]
  
  health_check_grace_period = 150
  health_check_type         = "EC2"

  #target_group_arns

  lifecycle {
    create_before_destroy = true
  }

  tag {
    key                 = "Name"
    value               = "${var.env}.${var.application_name}"
    propagate_at_launch = true
  }

  tag {
    key                 = "Environment"
    value               = var.env
    propagate_at_launch = true
  }

}

resource "aws_autoscaling_policy" "application_policy" {
  name                   = "application_policy"
  policy_type            = "TargetTrackingScaling"
  #adjustment_type        = "ChangeInCapacity"
//  cooldown               = 300
  estimated_instance_warmup = 150
  autoscaling_group_name = aws_autoscaling_group.application_asg.name

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }

    target_value = 70.0
  }
}

resource "aws_autoscaling_attachment" "asg_attachment_bar" {
  autoscaling_group_name = aws_autoscaling_group.application_asg.id
  alb_target_group_arn   = aws_alb_target_group.application_tg.arn
}