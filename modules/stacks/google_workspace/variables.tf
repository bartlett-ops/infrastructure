variable "stack_config" {
  type = object({
    route53_zone = object({
      zone_id = string
      name    = string
    })
    mx_record = optional(object({
      records = list(string)
      ttl = number
    }), {
      records = [
        "1 ASPMX.L.GOOGLE.COM",
        "5 ALT1.ASPMX.L.GOOGLE.COM",
        "5 ALT2.ASPMX.L.GOOGLE.COM",
        "10 ALT3.ASPMX.L.GOOGLE.COM",
        "10 ALT4.ASPMX.L.GOOGLE.COM",
      ]
      ttl = 300
    }) 
  })
}

