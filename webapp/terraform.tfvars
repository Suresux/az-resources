project_name  = "kpmg"
vertical_name = "retail"
env           = "dev"

location = "Central India"

app_service_plan_sku_name = "B1"
app_service_plan_os_type  = "Linux"

container_image_name = "ash:latest"

acr_sku           = "Basic"
acr_admin_enabled = false

always_on  = true
https_only = true

tags = {
  Owner = "DevOps"
}
