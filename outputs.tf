output "arn" {
  description = "Arn of the certificate"
  value       = aws_acm_certificate.cert.arn
}