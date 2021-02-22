variable "instance_type"{}

resource "aws_instance" "default" {
  ami                    = "ami-0992fc94ca0f1415a" #Amazon Linux2
  vpc_security_group_ids = [aws_security_group.default.id]
  instance_type          = var.instance_type
  key_name               = aws_key_pair.default.id

  tags = {
    Name = "tobari_ec2"    
  }
}

resource "aws_key_pair" "default" {
  key_name   = "example"
  public_key = file("${path.module}/key.pub")
}
