locals {
  app_service_plan_name = "${var.project_name}-${var.vertical_name}-${var.env}-asp"
  web_app_name          = "${var.project_name}-${var.vertical_name}-${var.env}-webapp"

}

#   default_app_settings = {
#     node = {
#       WEBSITE_NODE_DEFAULT_VERSION = "~${split("-", var.web_app_runtime_version)[0]}"
#     }
#   }

#   merged_app_settings = merge(
#     lookup(local.default_app_settings, var.web_app_runtime_stack, {}),
#     var.app_settings
#   )
# }

