variable "instance_type" {
  default = "t2.micro"
}

variable "ami" {
  default = "ami-00eeedc4036573771" # Ubuntu 20.04 LTS
}

variable "vpc_id" {
  default = "vpc-0abeadba9e4b656a8"
}

variable "subnets" {
  default = ["subnet-0e6be677dc7894da4", "subnet-028910f95fcfce01a"]
}

variable "instance_name" {
  default = "instancepostgres"
  }

variable "replication_slot_name" {
  default = "replication_slot"
}

variable "primary_instance_private_ip" {
  default = "172.31.1.16" # Replace with primary instance private IP
}

variable "backup_bucket_name" {
  default = "worktest112"
}
variable "aws_key_pair" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCpyBPQCRJGOFuzCQH/DTmvg+vwbA6voTtaQ+/RLg4ZPuB6HIYz+QiP1geCFhN6MBJ1wAaoG4+72Vjkkc8itnOMKGZRMT4a8s9iv+8eq6qw5Qz5kC8JzhUqbLAgsFNt8bQ9isIG3+SzXAOBmXirdxRmQbN0LRxEzKt78ab2Y5lk4pIC3gVrui3weaLPxF1G3biiUmMJ+KjxUwbrUzC7qmEJ4UncZaAnzSh2+eA412RF8vJ9Ev0KWajEO1rZz1dM4/lrZn72SZnHC5FnuWXtFgu8/Lmn643JaWZQn6sxBjvVuleySFIlOxzDAsB4fmAj8nnP3TlkIsX+W+RxLra19MsLzUOjz58EfutrFli9s2fH1SWiDM2vltBZO9PGR8mRf16G+1+loiiuWP9ekSYsJk+uLjaYUhA5xH+gWVx4EVMZOWQJravH44QvNsxsCaAD0mNDIno5fh+ollVeUDgWPbkWETHQlB1/83oV9ozL77ppzwlPbs7sIp2ouNa1pqp2X/4GyJosDBXM0hMLovlyUASfmXrDXJXi2Two5NzNsdKb1hzULhn4IG9rAq5nu3ZwdiN0rLFlJsJeMRHb4HFNTPgawFft8xLGZATWdjkC8v5eb3LYIdnSrqUZI9opVT5SZGK7jE+rLFaSPJwdorE+C04yfF5NRe7fmfZl6a8jzvgGgQ== baruwasamson4@gmail.com"
}