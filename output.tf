output "cron_lambda_arn" {
  value = "${aws_lambda_function.cron_lambda.arn}"
}
