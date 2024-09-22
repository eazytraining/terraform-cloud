# Create Security Group for EC2 Instances
resource "aws_security_group" "my_security_group" {
    vpc_id = aws_vpc.my_vpc.id

    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port   = 3306
        to_port     = 3306
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

# Create Security Group for RDS Instance
resource "aws_security_group" "rds_security_group" {
  vpc_id = aws_vpc.my_vpc.id

  # Inbound rule to accept connections from EC2 security group on port 3306
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    security_groups = [aws_security_group.my_security_group.id]
  }

  egress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    security_groups = [aws_security_group.my_security_group.id]
  }
}