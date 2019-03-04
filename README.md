# Terraform: lambda cron job

Deploy a lambda function to run on interval with terraform.

---

## Init
```
$ terraform init
```

## Configurable

`vars.tf`
- aws_region (`eu-west-1`)
- lambda_interval_metric (`minutes`)
- lambda_interval_value (`15`)
- lambda_name (`cronLambda`)
- lambda_runtime (`nodejs8.10`)
- lambda_source (`src/`)
- lambda_output (`dist/lambda.zip`)
- lambda_handler (`index.handler`)

## Deploy
```
$ terraform apply
```
