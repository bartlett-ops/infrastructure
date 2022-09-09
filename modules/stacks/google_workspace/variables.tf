variable "stack_config" {
  type = object({
    route53_zone = object({
      zone_id = string
      name    = string
    })
    mx_record = object({
      records = list(string)
      ttl     = optional(number, 300)
    })
    spf_record = optional(object({
      records = optional(list(string), ["v=spf1 include:_spf.google.com ~all"])
      ttl     = optional(number, 3600)
      }),
      {
        records = ["v=spf1 include:_spf.google.com ~all"]
        ttl     = 3600
    })
    dkim_record = optional(object({
      name    = optional(string, "google._domainkey")
      records = list(string)
      ttl     = optional(number, 300)
    }))
  })
}

