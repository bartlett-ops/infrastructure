variable "stack_config" {
  type = object({
    route53_zone = object({
      zone_id = string
      name    = string
    })
    mx_record = object({
      records = optional(list(string), [
        "1 ASPMX.L.GOOGLE.COM",
        "5 ALT1.ASPMX.L.GOOGLE.COM",
        "5 ALT2.ASPMX.L.GOOGLE.COM",
        "10 ALT3.ASPMX.L.GOOGLE.COM",
        "10 ALT4.ASPMX.L.GOOGLE.COM",
      ])
      ttl     = optional(number, 300)
    })
  })
}

