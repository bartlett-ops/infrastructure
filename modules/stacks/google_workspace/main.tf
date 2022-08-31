resource "aws_route53_record" "mx" {
  zone_id = local.stack_config.route53_zone.zone_id
  name    = local.stack_config.route53_zone.name
  type    = "MX"
  records = local.stack_config.mx_record.records
  ttl     = local.stack_config.mx_record.ttl
}
