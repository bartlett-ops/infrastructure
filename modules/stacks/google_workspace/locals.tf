locals {
  stack_config = merge(
    var.stack_config,
    {
      mx_record = {
        records = try(var.stack_config.mx_record.records, local.defaults.mx_record.records)
        ttl     = try(var.stack_config.mx_record.ttl, local.defaults.mx_record.ttl)
      }
    }
  )
}
