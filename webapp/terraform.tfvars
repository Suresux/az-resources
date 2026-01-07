project_name  = "att"
vertical_name = "cpg"
env           = "dev"

location = "Central India"

app_service_plan_sku_name = "B1"
app_service_plan_os_type  = "Linux"

container_image_name = "myapp:latest"

acr_sku           = "Basic"
acr_admin_enabled = false

always_on  = true
https_only = true

tags = {
  Owner = "DevOps"
}
