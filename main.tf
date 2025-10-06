module "demo_app" {
  source = "./modules/demo_app"
  for_each = { for app in var.my_apps : app.Environment => app }
  Environment = each.value.Environment
  port = each.value.port
}