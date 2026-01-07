# ===========================
# Resource Group
# ===========================
resource "azurerm_resource_group" "main" {
  name     = "${var.project_name}-${var.vertical_name}-${var.env}-rg"
  location = var.location
}

# ===========================
# Azure Container Registry
# ===========================
resource "azurerm_container_registry" "main" {
  name                = "${var.project_name}${var.vertical_name}${var.env}acr"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location

  sku           = var.acr_sku
  admin_enabled = var.acr_admin_enabled

  tags = var.tags
}

# ===========================
# Web App Module
# ===========================
module "webapp" {
  source = "../modules/webapp"

  project_name  = var.project_name
  vertical_name = var.vertical_name
  env           = var.env

  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  app_service_plan_sku_name = var.app_service_plan_sku_name
  app_service_plan_os_type  = var.app_service_plan_os_type

  container_registry_url = azurerm_container_registry.main.login_server
  container_image_name   = var.container_image_name

  always_on        = var.always_on
  https_only       = var.https_only
  identity_enabled = true

  tags = var.tags
}

# ===========================
# Read Web App (after update)
# ===========================
data "azurerm_linux_web_app" "webapp" {
  name                = module.webapp.web_app_name
  resource_group_name = azurerm_resource_group.main.name

  depends_on = [module.webapp]
}

# ===========================
# ACR Pull Role Assignment
# ===========================
resource "azurerm_role_assignment" "acr_pull" {
  scope                = azurerm_container_registry.main.id
  role_definition_name = "AcrPull"
  principal_id         = data.azurerm_linux_web_app.webapp.identity[0].principal_id

  depends_on = [
    azurerm_container_registry.main,
    data.azurerm_linux_web_app.webapp
  ]
}
