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
  })
}

