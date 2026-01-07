variable "project_name" { type = string }
variable "vertical_name" { type = string }
variable "env" { type = string }

variable "location" { type = string }

variable "app_service_plan_sku_name" { type = string }
variable "app_service_plan_os_type" { type = string }

variable "container_image_name" {
  description = "Docker image name WITH tag (example: myapp:latest)"
  type        = string
}

variable "acr_sku" { type = string }
variable "acr_admin_enabled" { type = bool }

variable "always_on" { type = bool }
variable "https_only" { type = bool }

variable "tags" {
  type    = map(string)
  default = {}
}


variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}

variable "tenant_id" {
  description = "Tenant ID of Azure AD"
  type        = string
}

variable "client_id" {
  description = "Service Principal client ID"
  type        = string
}

variable "client_secret" {
  description = "Service Principal secret"
  type        = string
  sensitive   = true
}
