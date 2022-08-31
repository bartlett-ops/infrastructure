locals {
  stack_config = merge(
    var.stack_config,
    {
      # Inject default for unset optional vars here
      # my_field = coalesce(var.stack_config.my_field, local.defaults.my_field)
    }
  )
}
