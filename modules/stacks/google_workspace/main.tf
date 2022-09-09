resource "aws_route53_record" "mx" {
  zone_id = var.stack_config.route53_zone.zone_id
  name    = var.stack_config.route53_zone.name
  type    = "MX"
  records = var.stack_config.mx_record.records
  ttl     = var.stack_config.mx_record.ttl
}

resource "aws_route53_record" "spf" {
  zone_id = var.stack_config.route53_zone.zone_id
  name    = var.stack_config.route53_zone.name
  type    = "TXT"
  records = var.stack_config.spf_record.records
  ttl     = var.stack_config.spf_record.ttl
}

resource "aws_route53_record" "dkim" {
  count   = var.stack_config.dkim_record != null ? 1 : 0
  zone_id = var.stack_config.route53_zone.zone_id
  name    = var.stack_config.dkim_record.name
  type    = "TXT"
  records = var.stack_config.dkim_record.records
  ttl     = var.stack_config.dkim_record.ttl
}

