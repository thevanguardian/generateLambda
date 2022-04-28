
resource "aws_cloudwatch_log_group" "generatedLogGroup" {
  name              = "/aws/lambda/${var.generatedName}"
  retention_in_days = 14
}
