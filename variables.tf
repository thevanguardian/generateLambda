variable "iamPolicyActions" {
  type        = list(any)
  description = "iamPolicyActions (list): List of actions to pass to the IAM policy generation"
}
variable "iamPolicyResources" {
  type        = list(any)
  description = "iamPolicyResources (list): List of resources that have the actions assigned during IAM policy generation"
}

variable "generatedName" {
  type        = string
  description = "generatedName (str): Name used across various resource identifiers"
}

variable "lambdaEnvVariables" {
  type        = map(any)
  description = "lambdaEnvVariables (map): Sets environment variables within the Lambda function"
  default     = {}
}

variable "lambdaHandler" {
  type        = string
  description = "lambdaHandler (str): Handler to be assigned to the Lambda function."
  default     = "lambda_function.lambda_handler"
}

variable "lambdaName" {
  type        = string
  description = "lambdaFileName (str): Identifies the Lambda name"
}

variable "lambdaSourcePath" {
  type        = string
  description = "lambdaSourcePath (str): Dir Path to the Lambda source file(s)"
}

variable "lambdaRuntime" {
  type        = string
  description = "lambdaRuntime (str): Runtime to assign to the generated Lambda"
  default     = "python3.9"
}

variable "lambdaTimeout" {
  type        = number
  description = "lambdaTimeout (number): Number of seconds before generated Lambda times out"
  default     = 30
}
