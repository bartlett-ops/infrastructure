data "aws_route53_zone" "zone" {
  name = local.route53_zone_name
}
