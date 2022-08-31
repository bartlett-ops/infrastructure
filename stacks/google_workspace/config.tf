locals {
  route53_zone_name = "bartlett.sh"
  stack_config = {
    route53_zone = data.aws_route53_zone.zone
    mx_record = {
      records = [
        "1 ASPMX.L.GOOGLE.COM",
        "5 ALT1.ASPMX.L.GOOGLE.COM",
        "5 ALT2.ASPMX.L.GOOGLE.COM",
        "10 ALT3.ASPMX.L.GOOGLE.COM",
        "10 ALT4.ASPMX.L.GOOGLE.COM",
        "15 mtxvqsn7gptm7l2lcxkncc4jk5kw2uz7qfb3u56c33avtktna3fa.mx-verification.google.com.",
      ]
    }
  }
}
