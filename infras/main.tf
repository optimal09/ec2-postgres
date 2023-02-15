# Create EC2 instance
resource "aws_instance" "instancepostgres" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = element(var.subnets, count.index)
  count         = length(var.subnets)

  user_data = filebase64("${path.module}/bootstrap.sh")

  tags = {
    Name = "${var.instance_name}-${count.index}"
  }
}