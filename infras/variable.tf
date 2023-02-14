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
  default = "my-backup-bucket"
}