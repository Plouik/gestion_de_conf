variable "my_apps" {
  type = list(object({
    ENVIRONMENT = string
    port         = number
  }))
  default = [
    { ENVIRONMENT = "PROD", port = 80 },
    { ENVIRONMENT = "DEV", port = 7000 }
  ]
}
