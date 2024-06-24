output "my_python_service_lambda_arn" {
  value = aws_lambda_function.my_python_service.arn
}

output "my_ts_service_lambda_arn" {
  value = aws_lambda_function.my_ts_service.arn
}
