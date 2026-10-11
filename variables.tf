variable "wafv2_web_acl_logging_configurations" {
  description = <<EOT
Map of wafv2_web_acl_logging_configurations, attributes below
Required:
    - log_destination_configs
    - resource_arn
Optional:
    - region
    - logging_filter (block):
        - default_behavior (required)
        - filter (required, block):
            - behavior (required)
            - condition (required, block):
                - action_condition (optional, block):
                    - action (required)
                - label_name_condition (optional, block):
                    - label_name (required)
            - requirement (required)
    - redacted_fields (block):
        - method (optional, block):
        - query_string (optional, block):
        - single_header (optional, block):
            - name (required)
        - uri_path (optional, block):
EOT

  type = map(object({
    log_destination_configs = set(string)
    resource_arn            = string
    region                  = optional(string)
    logging_filter = optional(object({
      default_behavior = string
      filter = list(object({
        behavior = string
        condition = list(object({
          action_condition = optional(object({
            action = string
          }))
          label_name_condition = optional(object({
            label_name = string
          }))
        }))
        requirement = string
      }))
    }))
    redacted_fields = optional(list(object({
      method = optional(object({
      }))
      query_string = optional(object({
      }))
      single_header = optional(object({
        name = string
      }))
      uri_path = optional(object({
      }))
    })))
  }))
  validation {
    condition = alltrue([
      for k, v in var.wafv2_web_acl_logging_configurations : (
        v.logging_filter == null || (length(v.logging_filter.filter) >= 1)
      )
    ])
    error_message = "Each filter list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.wafv2_web_acl_logging_configurations : (
        v.logging_filter == null || (alltrue([for item in v.logging_filter.filter : (length(item.condition) >= 1)]))
      )
    ])
    error_message = "Each condition list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.wafv2_web_acl_logging_configurations : (
        v.redacted_fields == null || (length(v.redacted_fields) <= 100)
      )
    ])
    error_message = "Each redacted_fields list must contain at most 100 items"
  }
  # Note: 8 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

