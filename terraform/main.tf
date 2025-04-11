provider "aws" {
  region = var.aws_region
}

resource "aws_key_pair" "default" {
  key_name   = "ssh_aws"
  public_key = file("/Users/clementinecheyrou-lagreze/.ssh/id_rsa.pub")
}

resource "aws_security_group" "wordpress_sg" {
  name        = "wordpress-sg"
  
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

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "wordpress" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.default.key_name
  security_groups       = [aws_security_group.wordpress_sg.name]
  associate_public_ip_address = true

  tags = {
    Name = "wordpress-instance"
  }
}

output "public_ip" {
	value = aws_instance.wordpress.public_ip
}
