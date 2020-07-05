resource "aws_lb" "application" {
  name               = "${var.env}-${var.application_name}-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.sg_main.id]
  subnets            = var.vpc_public_subnets


}


resource "aws_lb_listener" "alb_listener_http" {
  load_balancer_arn = aws_lb.application.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}


resource "aws_lb_listener" "alb_listener_https" {
  load_balancer_arn = aws_lb.application.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = var.certificate_arn

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.application_tg.arn
  }
}

resource "aws_alb_target_group" "application_tg" {
  name     = "${var.env}-${var.application_name}-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

   health_check {    
    healthy_threshold   = 3    
    unhealthy_threshold = 2    
    timeout             = 5    
    interval            = 10    
    path                = var.health_check_path    
    port                = "80"  
    matcher             = "200"
  }

}

