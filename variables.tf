variable "domain_name" {
  description = "Domain name for the certificate"
}

variable "validation_method" {
  description = "Certificate validation method"
  default     = "DNS"
}

variable "allow_overwrite" {
  description = "Allow record to be overwritten"
  default     = true
}