output "web_app_name" {
  value = module.webapp.web_app_name
}

output "acr_login_server" {
  value = azurerm_container_registry.main.login_server
}
