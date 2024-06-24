variable "region" {
  description = "The AWS region"
  type        = string
  default     = "eu-central-1"
}

variable "lambda_exec_role" {
  description = "The name for the AWS Lambda execution role"
  type        = string
  default     = "lambda_exec_role"
}
