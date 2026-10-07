variable "my_apps" {
  type = list(object({
    ENVIRONMENT = string
    port         = number
  }))
  default = [
    # { ENVIRONMENT = "prod", port = 80 },
    { ENVIRONMENT = "dev2", port = 7001 }
  ]
}
