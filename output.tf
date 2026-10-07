output "webapp_url" {
  value = [ for env in module.demo_app : env.ip_address ]
}