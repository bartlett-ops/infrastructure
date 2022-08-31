resource "aws_route53_record" "mx" {
  zone_id = var.stack_config.route53_zone.zone_id
  name    = var.stack_config.route53_zone.name
  type    = "MX"
  records = var.stack_config.mx_record.records
  ttl     = var.stack_config.mx_record.ttl
}
