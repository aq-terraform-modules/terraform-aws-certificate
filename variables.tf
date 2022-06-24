variable "domain_name" {
  description = "Domain name for the certificate"
}

variable "sub_domain" {
  description = "Subdomain to be used with domain_name for creating the certificate"
}

variable "validation_method" {
  description = "Certificate validation method"
  default     = "DNS"
}

variable "allow_overwrite" {
  description = "Allow record to be overwritten"
  default     = true
}

variable "tags" {
  description = "Tags for the certificate"
  type = map
  default = {}
}

variable "is_private_zone" {
  description = "Is the Route53 zone is private"
  type = bool
  default = false
}