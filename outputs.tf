output "lambdaArn" {
  description = "Lambda ARN from the generated resource(s)."
  value       = aws_lambda_function.generatedLambdaFunction.arn
}
