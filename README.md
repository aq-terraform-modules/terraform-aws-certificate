# terraform-aws-certificate
Terraform module which creates a AWS managed certificate using ACM

## Notes
Currently this module only supports AWS managed certificates only due to personal usage. I will update other options like Importing custom certificate and Creating private CA certificate.

## Usage
```hcl
module "certificate" {
  source  = "aq-terraform-modules/certificate/aws"
  version = "1.0.0"

  domain = "example.com"
  validation_method = "DNS"
  allow_overwrite = true
}
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.63 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.63 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| domain_name | A domain name for which the certificate should be issued | `String` | `N/A` | Yes
| validation_method | Which method to use for validation. DNS or EMAIL are valid, NONE can be used for certificates that were imported into ACM and then into Terraform. | `String` | `DNS` | No
| allow_overwrite | Whether to allow overwriting existing records in route53 | `Boolean` | `True` | No