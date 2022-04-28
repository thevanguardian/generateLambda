data "aws_iam_policy_document" "generatedLambdaAssume" {
  statement {
    sid     = "AssumeRole"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "generatedPutLogs" {
  statement {
    sid = "PutLogs"
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents"
    ]
    resources = ["*"]
  }
}

data "aws_iam_policy_document" "generatedPolicy" {
  source_json = data.aws_iam_policy_document.generatedPutLogs.json
  statement {
    sid       = "ScopedActions"
    actions   = var.iamPolicyActions
    resources = var.iamPolicyResources
  }
}

data "archive_file" "generatedLambdaFunction" {
  type        = "zip"
  output_path = "${path.root}/.terraform/${var.lambdaName}.zip"
  source_dir  = var.lambdaSourcePath
}
