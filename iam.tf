module "iam_role" {
  count              = var.useRole != "" ? 1 : 0
  source             = "thevanguardian/generateIamRole/aws"
  version            = "2.3.1"
  roleNamePrefix     = "generateLambdaAccess-"
  rolePath           = "/service/"
  maxSessionDuration = 7200
  assumeConfig = {
    actions     = ["sts:AssumeRole"]
    type        = "AWS"
    identifiers = ["lambda.amazonaws.com"]
  }
  scopedConfig = {
    actions   = var.iamPolicyActions
    resources = var.iamPolicyResources
  }
  unscopedConfig = {
    actions = var.unscopedIamPolicyActions
  }
}
