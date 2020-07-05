

resource "aws_route53_record" "wp" {
  zone_id = var.zone_id
  name    = var.wp_url
  type    = "A"

  alias {
    name                   = aws_lb.application.dns_name
    zone_id                = aws_lb.application.zone_id
    evaluate_target_health = false
  }
}