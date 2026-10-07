output "webapp_url" {
  value = one([ for env in module.demo_app : env.ip_address ])
}