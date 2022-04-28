resource "aws_iam_role" "generatedRole" {
  name               = var.generatedName
  assume_role_policy = data.aws_iam_policy_document.generatedLambdaAssume.json
  inline_policy {
    name   = "ScopedExecution"
    policy = data.aws_iam_policy_document.generatedPolicy.json
  }
}
