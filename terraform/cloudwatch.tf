resource "aws_cloudwatch_metric_alarm" "high_error_rate" {
  alarm_name          = "${var.app_name}-high-error-rate"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "HTTPCode_Target_5XX_Count"
  namespace           = "AWS/ApplicationELB"
  period              = 60
  statistic           = "Sum"
  threshold           = 10
  alarm_description   = "This alarm monitors for high error rates in the application"

  dimensions = {
    LoadBalancer = aws_lb.app.arn_suffix
    TargetGroup  = aws_lb_target_group.app.arn_suffix
  }

  tags = var.tags
}


# module "error_log_alarm" {
#   source = "./modules/cloudwatch-log-alarm"

#   log_group_name = "/aws/ecs/cat-gif-generator"
#   log_pattern    = "ERROR"
#   alarm_name     = "cat-gif-error-alarm"
#   threshold      = 10
#   email_endpoint = "reddyd597@gmail.com"
# }
