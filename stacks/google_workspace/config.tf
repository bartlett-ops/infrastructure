locals {
  route53_zone_name = "bartlett.sh"
  stack_config = {
    route53_zone = data.aws_route53_zone.zone
  }
}
