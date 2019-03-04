variable "aws_region" {
    type = "string"
    default = "eu-west-1"
}

variable "lambda_output" {
    type = "string"
    default = "dist/lambda.zip"
}

variable "lambda_source" {
    type = "string"
    default = "src/"
}

variable "lambda_interval_value" {
    type = "string"
    default = "15"
}

variable "lambda_interval_metric" {
    type = "string"
    default = "minutes"
}

variable "lambda_name" {
    type = "string"
    default = "trCheck"
}

variable "lambda_runtime" {
    type = "string"
    default = "nodejs8.10"
}

variable "lambda_handler" {
    type = "string"
    default = "index.handler"
}