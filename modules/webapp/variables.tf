variable "project_name" {
  type = string
}

variable "vertical_name" {
  type = string
}

variable "env" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "app_service_plan_sku_name" {
  type = string
}

variable "app_service_plan_os_type" {
  type = string
  validation {
    condition     = var.app_service_plan_os_type == "Linux"
    error_message = "Docker-based Web App supports Linux only."
  }
}

variable "container_registry_url" {
  description = "ACR login server (example: myacr.azurecr.io)"
  type        = string
}

variable "container_image_name" {
  description = "Docker image name WITH tag (example: myapp:latest)"
  type        = string
}

variable "always_on" {
  type = bool
}

variable "https_only" {
  type = bool
}

variable "identity_enabled" {
  type    = bool
  default = true
}

variable "tags" {
  type    = map(string)
  default = {}
}
