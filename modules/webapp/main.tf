# ===========================
# App Service Plan (Linux)
# ===========================
resource "azurerm_service_plan" "main" {
  name                = local.app_service_plan_name
  location            = var.location
  resource_group_name = var.resource_group_name

  os_type  = "Linux"
  sku_name = var.app_service_plan_sku_name

  tags = var.tags
}

# ===========================
# Linux Web App (Docker)
# ===========================
resource "azurerm_linux_web_app" "main" {
  name                = local.web_app_name
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id     = azurerm_service_plan.main.id

  https_only = var.https_only

  site_config {
    always_on = var.always_on

    # Use Managed Identity to pull from ACR
    container_registry_use_managed_identity = true

    application_stack {
      docker_image_name = "${var.container_registry_url}/${var.container_image_name}"
    }
  }

  # Required for Docker + ACR
  app_settings = {
    DOCKER_REGISTRY_SERVER_URL = "https://${var.container_registry_url}"
  }

  dynamic "identity" {
    for_each = var.identity_enabled ? [1] : []
    content {
      type = "SystemAssigned"
    }
  }

  tags = var.tags
}
