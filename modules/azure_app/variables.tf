variable "environment" {
  type        = string
  description = "Prefix of the container name that's combined with a random value so name is unique in your Azure subscription."
  default     = "DEV"
}

variable "port" {
  type        = number
  description = "Port to open on the container and the public IP address."
  default     = 80
}


variable "image" {
  type        = string
  description = "Container image to deploy. Should be of the form repoName/imagename:tag for images stored in public Docker Hub, or a fully qualified URI for other registries. Images from private registries require additional registry credentials."
  default     = "configuration-backend:latest"
} 

variable "registry" {
  type        = string
  description = "Container image registry"
  default     = "omiomidemoomi.azurecr.io"
}

variable "identity_username" {
  type        = string
  default     = "myID"
}

variable "ressource_group" {
  type        = string
  default     = "configuration-demo"
}

variable "cpu_cores" {
  type        = number
  description = "The number of CPU cores to allocate to the container."
  default     = 1
}

variable "memory_in_gb" {
  type        = number
  description = "The amount of memory to allocate to the container in gigabytes."
  default     = 2
}

variable "restart_policy" {
  type        = string
  description = "The behavior of Azure runtime if container has stopped."
  default     = "Always"
  validation {
    condition     = contains(["Always", "Never", "OnFailure"], var.restart_policy)
    error_message = "The restart_policy must be one of the following: Always, Never, OnFailure."
  }
}
