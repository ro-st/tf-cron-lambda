provider "aws" {
    region = "${var.aws_region}"
}

resource "null_resource" "bootstrap" {
    provisioner "local-exec" {
        command = "./scripts/bootstrap.sh"
        interpreter = ["sh", "-c"]
    }
}

resource "aws_lambda_function" "cron_lambda" {
    filename = "${var.lambda_output}"
    source_code_hash = "${data.archive_file.cron_lambda.output_base64sha256}"
    function_name = "${var.lambda_name}"
    runtime = "${var.lambda_runtime}"
    role = "${aws_iam_role.lambda_role.arn}"
    handler = "${var.lambda_handler}"
}

resource "aws_cloudwatch_event_rule" "cron_job" {
    name = "${var.lambda_name}-cron-job"
    description = "cron job for lambda function ${var.lambda_name}"
    schedule_expression = "rate(${var.lambda_interval_value} ${var.lambda_interval_metric})"
}

resource "aws_cloudwatch_event_target" "target" {
    rule = "${aws_cloudwatch_event_rule.cron_job.name}"
    target_id = "cron_lambda_target"
    arn = "${aws_lambda_function.cron_lambda.arn}"
}

resource "aws_lambda_permission" "allow_cloudwatch_cron_invoke" {
    statement_id = "AllowExecutionFromCloudwatch"
    action = "lambda:InvokeFunction"
    function_name = "${var.lambda_name}"
    principal = "events.amazonaws.com"
    source_arn = "${aws_cloudwatch_event_target.target.arn}"
}