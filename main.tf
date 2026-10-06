terraform {
  required_version = ">= 1.12.6"
}

module "demo_app" {
  source      = "./modules/demo_app"
  for_each    = { for app in var.my_apps : app.ENVIRONMENT => app }
  ENVIRONMENT = each.value.ENVIRONMENT
  port        = each.value.port
}