# Create EC2 instance
resource "aws_instance" "instancepostgres" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.ssh_key_name
  vpc_security_group_ids = [aws_security_group.example.id]
  subnet_id     = element(var.subnets, count.index)
  count         = length(var.subnets)

  tags = {
    Name = "${var.instance_name}-${count.index}"
  }
}