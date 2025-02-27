variable "log_group_name" {
  description = "Name of the CloudWatch log group to monitor"
  type        = string
}

variable "log_pattern" {
  description = "Pattern to match in the logs"
  type        = string
}

variable "alarm_name" {
  description = "Name for the CloudWatch alarm"
  type        = string
}

variable "threshold" {
  description = "Number of occurrences to trigger the alarm"
  type        = number
  default     = 10
}

variable "metric_namespace" {
  description = "Namespace for the CloudWatch metric"
  type        = string
  default     = "LogMetrics"
}

variable "email_endpoint" {
  description = "Email address to send notifications to"
  type        = string
}
