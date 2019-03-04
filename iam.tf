resource "aws_iam_role" "lambda_role" {
    name = "tr-check-role"
    assume_role_policy = "${data.aws_iam_policy_document.assume_role_policy.json}"
}

resource "aws_iam_role_policy" "lambda_role_policy" {
    name = "tr-check-policy"
    role = "${aws_iam_role.lambda_role.id}"
    policy = "${data.aws_iam_policy_document.lambda_policy.json}"
}
