# Key Pair
resource "aws_key_pair" "my_key_pair" {
  key_name   = "terra-key"
  public_key = file("terra-key.pub")
}

# Default VPC
resource "aws_default_vpc" "default" {}

# Security Group
resource "aws_security_group" "my_sec_grp" {
  name        = "my_sec_grp"
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
  ami             = "ami-020cba7c55df1f615"
  instance_type   = "t2.micro"
  key_name        = aws_key_pair.my_key_pair.key_name
  vpc_security_group_ids = [aws_security_group.my_sec_grp.id]

  root_block_device {
    volume_type = "gp3"
    volume_size = 15
  }

  tags = {
    Name = "my_instance"
  }
}
