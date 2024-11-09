locals {
  common_tags = {
    owner       = lower(var.owner)
    project     = lower(var.project)
    environment = lower(var.environment)
  }

  prefix_name = lower("${var.project}-${var.environment}")
}