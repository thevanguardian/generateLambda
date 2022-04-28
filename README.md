# Deploy an AWS Lambda Function.
Sets up and deploys a Lambda function while building out standardized Cloudwatch Logs, IAM permissions, and data pack generation.

# Example Usage
```hcl
module "this" {
  source = "git::git@github.com:thevanguardian/generateLambda.git?ref=<module-version-here>"
  iamPolicyActions = [
    "sns:Publish"
  ]
  iamPolicyResources = [
    aws_sns_topic.macguffin.arn
  ]
  generatedName      = var.appName
  lambdaEnvVariables = {
    TARGET_REPOSITORIES = var.targetRepositories,
    SNS_TOPIC           = aws_sns_topic.macguffin.arn
  }
  lambdaFileName   = var.appName
  lambdaSourcePath = "${path.root}/lambda/"
  lambdaRuntime    = "python3.9"
  lambdaHandler    = "lambda_function.lambda_handler"
}
```
