variable "my_apps" {
  type = list(object({
    Environment = string
    port         = number
  }))
  default = [
    { Environment = "prod", port = 80 },
    #{ Environment = "dev", port = 7000 }
  ]
}