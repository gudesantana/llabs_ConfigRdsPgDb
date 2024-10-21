resource "aws_security_group" "sg_rds" {
  name        = "sg_rds_${var.project_name}_${var.environment}"
  description = "controls access to the database"
  vpc_id      = var.vpc_id

  ingress {
    protocol    = "tcp"
    from_port   = var.rds_port
    to_port     = var.rds_port
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 0
    to_port   = 0
    protocol  = -1
    self      = true
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_subnet_group" "db_subnet" {
  name       = "db-subnet-${var.project_name}-${var.environment}"
  subnet_ids = [var.vpc_subnet_private_1a, var.vpc_subnet_private_1c]
}


resource "aws_rds_cluster" "clu-db" {
  cluster_identifier        = "clu-${var.project_name}-${var.environment}"
  engine                    = var.engine
  engine_version            = var.engine_version
  availability_zones        = var.availability_zones
  database_name             = var.db_name
  master_username           = var.username
  master_password           = var.password
  db_subnet_group_name      = aws_db_subnet_group.db_subnet.id
  vpc_security_group_ids    = [aws_security_group.sg_rds.id]
  final_snapshot_identifier = "fsi-clu-${var.project_name}-${var.environment}"
  skip_final_snapshot       = true
  apply_immediately         = true
  backup_retention_period   = 7
  preferred_backup_window   = var.backup_window
  tags = {
    Name        = "clu-${var.project_name}-${var.environment}"
    Module      = "modules/rds"
    Environment = var.environment
  }
  lifecycle {
    ignore_changes = [availability_zones]
  }
}

resource "aws_rds_cluster_instance" "instance-db" {
  identifier         = "instance-${var.project_name}-${var.environment}-01"
  cluster_identifier = aws_rds_cluster.clu-db.id
  instance_class     = var.instance_class
  engine             = aws_rds_cluster.clu-db.engine
  engine_version     = aws_rds_cluster.clu-db.engine_version
  availability_zone  = var.availability_zone
  tags = {
    Name        = "instance-${var.project_name}-${var.environment}"
    Module      = "modules/rds"
    Environment = var.environment
  }
}