data "aws_route53_zone" "route53_zone" {
  name         = var.domain_name
  private_zone = var.is_private_zone
}

resource "aws_acm_certificate" "cert" {
  domain_name       = data.aws_route53_zone.route53_zone.name
  validation_method = var.validation_method

  tags = var.tags
}

resource "aws_route53_record" "cert" {
  for_each = {
    for dvo in aws_acm_certificate.cert.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = var.allow_overwrite
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = data.aws_route53_zone.route53_zone.zone_id
}

resource "aws_acm_certificate_validation" "cert" {
  certificate_arn         = aws_acm_certificate.cert.arn
  validation_record_fqdns = [for record in aws_route53_record.cert : record.fqdn]
}