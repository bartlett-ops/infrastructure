variable "stack_config" {
  type = object({
    route53_zone = object({
      zone_id = string
      name    = string
    })
    mx_record = optional(object({
      records = optional(list(string))
      ttl     = optional(number)
    }))
  })
}

