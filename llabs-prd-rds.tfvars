#####################################
# Global Variables
#####################################

environment    = "prd"
aws_region     = "us-east-1"
aws_profile    = "default"
aws_account_id = "816069124394"
project_name   = "llabs-rds-mysql"

#####################################
# rds aurora Variables
#####################################

vpc_id                  = "vpc-0f71f8897cf106f7c"
vpc_subnet_private_1a   = "subnet-0539fca403854288a"
vpc_subnet_private_1c   = "subnet-02642b3b8b369e7d4"
vpc_subnet_public_1a    = "subnet-06b6f2ff966533c14"
vpc_subnet_public_1c    = "subnet-0794788c08965388e"
allocated_storage       = "5"
availability_zones      = ["us-east-1a", "us-east-1c"]
availability_zone       = "us-east-1a"
storage_type            = "gp2"
db_name                 = "LlabsRdsMysqlApps"
engine                  = "mysql"
engine_version          = "8.0.39"
instance_class          = "db.t4g.micro"
rds_port                = "3306"
username                = "admin"
password                = "llabs1278"
maintenance_window      = "Mon:00:00-Mon:03:00"
backup_window           = "03:00-06:00"
backup_retention_period = "0"
apply_immediately       = "true"
skip_final_snapshot     = "true"
multi_az                = "true"
publicly_accessible     = "true"
deletion_protection     = "false"