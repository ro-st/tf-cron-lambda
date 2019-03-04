data "aws_iam_policy_document" "assume_role_policy" {
    statement = {
        actions = ["sts:AssumeRole"]
        principals = {
            type = "Service"
            identifiers = ["lambda.amazonaws.com"]
        }
    }
}

data "aws_iam_policy_document" "lambda_policy" {
    statement {
        effect = "Allow"
        actions = [
            "logs:CreateLogGroup",
            "logs:CreateLogStream",
            "logs:PutLogEvents",
            "s3:listAllMyBuckets"
        ]
        resources = ["*"]
    }
}

data "archive_file" "cron_lambda" {
    type = "zip"
    source_dir = "${var.lambda_source}"
    output_path = "${var.lambda_output}"
}