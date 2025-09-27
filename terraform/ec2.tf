resource "aws_security_group" "vprofile_ec2_sg" {
  name        = "vprofile-ec2-sg"
  description = "Allow SSH"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
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

resource "aws_instance" "vprofile_ec2" {
  ami                    = "ami-0c02fb55956c7d316"
  instance_type          = "t3.micro"
  subnet_id              = module.vpc.public_subnets[0]
  vpc_security_group_ids = [aws_security_group.vprofile_ec2_sg.id]

  tags = {
    Name = "vprofile-ec2"
  }
}