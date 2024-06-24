terraform {
  backend "s3" {
    bucket = "my-terraform-state-bucket-with-a-unique-name-d28c09a2"
    key    = "terraform.tfstate"
    region = "eu-central-1"
    encrypt = true
  }
}

provider "aws" {
  region = var.region
}

resource "aws_lambda_function" "my_python_service" {
  function_name    = "my-python-service"
  handler          = "main.handler"
  runtime          = "python3.12"
  role             = aws_iam_role.lambda_exec.arn
  filename         = "${path.module}/../build/my-python-service.zip"
  source_code_hash = filebase64sha256("${path.module}/../build/my-python-service.zip")
}

resource "aws_lambda_function_url" "my_python_service_url" {
  function_name      = aws_lambda_function.my_python_service.function_name
  authorization_type = "NONE"
}

resource "aws_lambda_function" "my_ts_service" {
  function_name    = "my-ts-service"
  handler          = "index.handler"
  runtime          = "nodejs20.x"
  role             = aws_iam_role.lambda_exec.arn
  filename         = "${path.module}/../build/my-ts-service.zip"
  source_code_hash = filebase64sha256("${path.module}/../build/my-ts-service.zip")
}

resource "aws_lambda_function_url" "my_ts_service_url" {
  function_name      = aws_lambda_function.my_ts_service.function_name
  authorization_type = "NONE"
}

resource "aws_iam_role" "lambda_exec" {
  name = var.lambda_exec_role

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_policy" {
  role       = aws_iam_role.lambda_exec.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}
