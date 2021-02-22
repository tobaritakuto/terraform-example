variable "instance_type"{}
variable "subnet_id"{}

resource "aws_instance" "default" {
  subnet_id              = var.subnet_id
  ami                    = "ami-0992fc94ca0f1415a" #Amazon Linux2
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.default.id]
  key_name               = aws_key_pair.tobari.id

  tags = {
    Name = "tobari_ec2"    
  }
}

resource "aws_key_pair" "tobari" {
  key_name   = "tobari_public_key"
  public_key = file("${path.module}/key.pub")
}
