variable "Environment" {
  description = "dev/prod"
  type        = string
  default     = "dev"
}

variable "port" {
  description = "Le port auquelle l'application est accessible"
  type        = number
  default     = 80
}
