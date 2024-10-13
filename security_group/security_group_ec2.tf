# Security Group cho Public Instance
resource "aws_security_group" "public_sg" {
  vpc_id = var.vpc_id

  # Inbound rule - cho phép SSH từ Internet
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["42.116.6.42/32"]  # Cho phép từ bất kỳ IP nào
  }

  # Outbound rule - cho phép tất cả lưu lượng ra ngoài
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "PublicInstanceSecurityGroup"
  }
}

# Security Group cho Private Instance
resource "aws_security_group" "private_sg" {
  vpc_id = var.vpc_id

  # Inbound rule - cho phép SSH chỉ từ Public Instance
  ingress {
    from_port              = 22
    to_port                = 22
    protocol               = "tcp"
    security_groups      = [aws_security_group.public_sg.id]  # Cho phép từ Public SG
  }

  # Outbound rule - cho phép tất cả lưu lượng ra ngoài
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "PrivateInstanceSecurityGroup"
  }
}

output "public_sg_id" {
  value       = aws_security_group.public_sg.id
  description = "Public EC2 Security Group ID"
}

output "private_sg_id" {
  value       = aws_security_group.private_sg.id
  description = "Public EC2 Security Group ID"
}
