# Create EC2 instance
resource "aws_instance" "instancepostgres" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = element(var.subnets, count.index)
  count         = length(var.subnets)

  tags = {
    Name = "${var.instance_name}-${count.index}"
  }
  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update
              sudo apt-get install -y postgresql-12 postgresql-client-12 postgresql-contrib-12 awscli
              sudo sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/g" /etc/postgresql/12/main/postgresql.conf
              sudo sed -i "s/#wal_level = replica/wal_level = replica/g" /etc/postgresql/12/main/postgresql.conf
              sudo sed -i "s/#max_wal_senders = 10/max_wal_senders = 3/g" /etc/postgresql/12/main/postgresql.conf
              sudo sed -i "s/#wal_keep_segments = 0/wal_keep_segments = 32/g" /etc/postgresql/12/main/postgresql.conf
              sudo systemctl restart postgresql
              sudo -u postgres psql -c "CREATE USER replication WITH REPLICATION ENCRYPTED PASSWORD 'replication';"
              sudo -u postgres psql -c "ALTER SYSTEM SET primary_conninfo = 'host=${var.primary_instance_private_ip} port=5432 user=replication password=replication application_name=${var.instance_name}-${count.index}'"
              sudo -u postgres psql -c "ALTER SYSTEM SET primary_slot_name = '${var.replication_slot_name}'"
              sudo systemctl restart postgresql
              aws s3 cp s3://${var.backup_bucket_name}/pg_backup.config /etc/postgresql/12/main/pg_backup.config
              aws s3 cp s3://${var.backup_bucket_name}/pg_backup.sh /usr/local/bin/pg_backup.sh
              chmod +x /usr/local/bin/pg_backup.sh
              echo "0 0 * * * /usr/local/bin/pg_backup.sh" | sudo crontab -
              EOF
}