resource "aws_cloudwatch_log_metric_filter" "log_metric_filter" {
  name           = "${var.alarm_name}-filter"
  pattern        = var.log_pattern
  log_group_name = var.log_group_name

  metric_transformation {
    name      = "${var.alarm_name}-metric"
    namespace = var.metric_namespace
    value     = "1"
  }
}

resource "aws_cloudwatch_metric_alarm" "log_alarm" {
  alarm_name          = var.alarm_name
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "${var.alarm_name}-metric"
  namespace           = var.metric_namespace
  period              = 60  # 1 minute
  statistic           = "Sum"
  threshold           = var.threshold
  alarm_description   = "Alarm when log pattern '${var.log_pattern}' appears more than ${var.threshold} times in a minute"
  alarm_actions       = [aws_sns_topic.alarm_notification.arn]
  treat_missing_data  = "notBreaching"
}

resource "aws_sns_topic" "alarm_notification" {
  name = "${var.alarm_name}-topic"
}

resource "aws_sns_topic_subscription" "email_subscription" {
  topic_arn = aws_sns_topic.alarm_notification.arn
  protocol  = "email"
  endpoint  = var.email_endpoint
}
