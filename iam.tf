module "iam_role" {
  source             = "thevanguardian/generateIamRole/aws"
  version            = "1.0.3"
  roleName           = "generateLambdaAccess"
  rolePath           = "/service"
  maxSessionDuration = 7200

  assumeIdentifiers = ["lambda.amazonaws.com"]
  scopedActions     = var.iamPolicyActions
  scopedResources   = var.iamPolicyResources
  unscopedActions   = var.unscopedIamPolicyActions
}
