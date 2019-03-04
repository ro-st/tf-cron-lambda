# Terraform: lambda cron job

Deploy a lambda function to run on interval with terraform.

---

## Init
```
$ terraform init
```

## Configurable

- aws_region
- lambda_interval_metric
- lambda_interval_value
- lambda_name
- lambda_runtime
- lambda_source
- lambda_output
- lambda_handler

## Deploy
```
$ terraform apply
```
