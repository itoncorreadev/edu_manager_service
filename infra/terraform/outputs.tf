output "instance_public_ip" {
  description = "Endereço IP público da instância EC2"
  value       = aws_instance.rails_app.public_ip
}

output "instance_public_dns" {
  description = "Hostname público da instância EC2"
  value       = aws_instance.rails_app.public_dns
}

output "ssh_connection_command" {
  description = "Comando pronto para conectar via SSH"
  value       = "ssh -i ~/.ssh/minha-chave.pem ubuntu@${aws_instance.rails_app.public_ip}"
}
