resource "aws_lambda_function" "generatedLambdaFunction" {
  filename         = data.archive_file.generatedLambdaFunction.output_path
  function_name    = var.generatedName
  role             = aws_iam_role.generatedRole.arn
  handler          = var.lambdaHandler
  runtime          = var.lambdaRuntime
  source_code_hash = filebase64sha256(data.archive_file.generatedLambdaFunction.output_path)
  timeout          = var.lambdaTimeout
  depends_on = [
    aws_cloudwatch_log_group.generatedLogGroup
  ]
  environment {
    variables = var.lambdaEnvVariables
  }
}
