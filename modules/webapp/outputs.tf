output "web_app_name" {
  description = "Web App name"
  value       = azurerm_linux_web_app.main.name
}

output "web_app_id" {
  description = "Web App resource ID"
  value       = azurerm_linux_web_app.main.id
}
