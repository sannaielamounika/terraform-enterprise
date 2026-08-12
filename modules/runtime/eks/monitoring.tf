################################################################################
# FILE DEFINITION : monitoring.tf for EKS Module  Creates CloudWatch monitoring resources such as metrics and alarms. For example, an alarm when worker-node CPU becomes too high.
# PURPOSE         : Manages the monitoring component within the eks architecture.
################################################################################

resource "aws_cloudwatch_metric_alarm" "node_cpu_high" {
  alarm_name          = "${local.cluster_name}-high-cpu-utilization"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 2
  metric_name         = "node_cpu_utilization"
  namespace           = "ContainerInsights"
  period              = 300
  statistic           = "Average"
  threshold           = 85
  alarm_description   = "Alarm when EKS worker node CPU exceeds 85% for 10 minutes"
  dimensions          = { ClusterName = local.cluster_name }
  tags                = local.common_tags
}
