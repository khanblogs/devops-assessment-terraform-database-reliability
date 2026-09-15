environment = "dev"

region = "ap-south-1"

vpc_cidr = "10.0.0.0/16"

availability_zones = [
  "ap-south-1a",
  "ap-south-1b"
]

public_subnet_cidrs = [
  "10.0.1.0/24",
  "10.0.2.0/24"
]

private_subnet_cidrs = [
  "10.0.11.0/24",
  "10.0.12.0/24"
]

container_image = "nginx:alpine"

container_port = 80

ecs_cpu = 256

ecs_memory = 512

desired_count = 1

rds_instance_class = "db.t3.micro"

rds_allocated_storage = 20

backup_retention_period = 3

deletion_protection = false

database_name = "hotel_booking"

db_username = "appuser"

db_password = "assessment-only-password"
