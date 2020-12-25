output "machine-dns" {
  value       = aws_instance.tf-web1.public_dns
}
output "machine-ip" {
  value       = aws_instance.tf-web1.public_ip
  sensitive   = true
  description = "description"
}