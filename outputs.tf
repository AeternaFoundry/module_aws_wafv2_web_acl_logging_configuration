output "wafv2_web_acl_logging_configurations_id" {
  description = "Map of id values across all wafv2_web_acl_logging_configurations, keyed the same as var.wafv2_web_acl_logging_configurations"
  value       = { for k, v in aws_wafv2_web_acl_logging_configuration.wafv2_web_acl_logging_configurations : k => v.id if v.id != null && length(v.id) > 0 }
}
output "wafv2_web_acl_logging_configurations_log_destination_configs" {
  description = "Map of log_destination_configs values across all wafv2_web_acl_logging_configurations, keyed the same as var.wafv2_web_acl_logging_configurations"
  value       = { for k, v in aws_wafv2_web_acl_logging_configuration.wafv2_web_acl_logging_configurations : k => v.log_destination_configs if v.log_destination_configs != null && length(v.log_destination_configs) > 0 }
}
output "wafv2_web_acl_logging_configurations_logging_filter" {
  description = "Map of logging_filter values across all wafv2_web_acl_logging_configurations, keyed the same as var.wafv2_web_acl_logging_configurations"
  value       = { for k, v in aws_wafv2_web_acl_logging_configuration.wafv2_web_acl_logging_configurations : k => one(v.logging_filter) if v.logging_filter != null && length(v.logging_filter) > 0 }
}
output "wafv2_web_acl_logging_configurations_redacted_fields" {
  description = "Map of redacted_fields values across all wafv2_web_acl_logging_configurations, keyed the same as var.wafv2_web_acl_logging_configurations"
  value       = { for k, v in aws_wafv2_web_acl_logging_configuration.wafv2_web_acl_logging_configurations : k => v.redacted_fields if v.redacted_fields != null && length(v.redacted_fields) > 0 }
}
output "wafv2_web_acl_logging_configurations_region" {
  description = "Map of region values across all wafv2_web_acl_logging_configurations, keyed the same as var.wafv2_web_acl_logging_configurations"
  value       = { for k, v in aws_wafv2_web_acl_logging_configuration.wafv2_web_acl_logging_configurations : k => v.region if v.region != null && length(v.region) > 0 }
}
output "wafv2_web_acl_logging_configurations_resource_arn" {
  description = "Map of resource_arn values across all wafv2_web_acl_logging_configurations, keyed the same as var.wafv2_web_acl_logging_configurations"
  value       = { for k, v in aws_wafv2_web_acl_logging_configuration.wafv2_web_acl_logging_configurations : k => v.resource_arn if v.resource_arn != null && length(v.resource_arn) > 0 }
}

