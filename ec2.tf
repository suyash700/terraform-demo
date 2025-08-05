# Key Pair
resource "aws_key_pair" "my_key_pair" {
  key_name   = "terraform-key"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGsJiyRtavPC1VsbLjPBTthjIr8QG+YJbsKEQRB4Ytbm ubuntu@ip-172-31-24-163"
}

# Default VPC
resource "aws_default_vpc" "default" {}

# Security Group
resource "aws_security_group" "my_sec_grp" {
  name        = var.aws_security_group
  description = "Custom sec grp for inbound and outbound traffic"
  vpc_id      = aws_default_vpc.default.id

  # Inbound Rules
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound Rules
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 Instance
resource "aws_instance" "my_instance" {
  ami             = "ami-01f23391a59163da9"
  instance_type   = var.aws_instance_type
  key_name        = aws_key_pair.my_key_pair.key_name
  vpc_security_group_ids = [aws_security_group.my_sec_grp.id]

  root_block_device {
    volume_type = "gp3"
    volume_size = var.env =="prd" ? 20 : var.aws_root_storage
  }

  tags = {
    Name = "my_instance"
  }
}

resource "aws_instance" "new_instance"{
      ami = "unknown"
      instance_type = "unknown"  
    }
