variable "aws_region" {
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  type        = string
  default     = "t3.micro"
}

variable "ami_id" {
  type        = string
  description = "Ubuntu 22.04 AMI ID (use um ID válido da sua região)"
}

variable "ssh_public_key_path" {
  type        = string
  default     = "id_rsa.pub"
}

variable "allowed_ip" {
  type        = string
  description = "Seu IP público (para acesso SSH seguro)"
}

variable "iam_instance_profile" {
  type        = string
  default     = null
  description = "Nome do IAM Instance Profile (opcional)"
}
