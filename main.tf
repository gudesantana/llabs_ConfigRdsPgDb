locals {
  tags = {
    Project_name = var.project_name
    # CreatedOn    = timestamp()
    Environment = var.environment
  }
}

# Necessario criar a policy primeiro para atachar na role #
module "roles" {
  source = "./modules/IamRoles"

  aws_region     = var.aws_region
  aws_profile    = var.aws_profile
  aws_account_id = var.aws_account_id

  roles = {

    # CrossAccountAdminRole = {
    #   policies               = ["arn:aws:iam::aws:policy/AdministratorAccess"]
    #   assumable_by_roles     = ["arn:aws:iam::242680874315:root"]
    # }

    "role-${var.project_name}-lambda-fullaccess-${var.environment}" = {
      policies           = ["arn:aws:iam::aws:policy/AWSLambda_FullAccess"]
      assumable_by_roles = ["arn:aws:iam::242680874315:root"]
    }

    # ViewOnlyFederatedRole = {
    #   policies               = [
    #     "arn:aws:iam::aws:policy/job-function/ViewOnlyAccess",
    #     "arn:aws:iam::aws:policy/ReadOnlyAccess"
    #   ]
    #   assumable_by_federated = ["arn:aws:iam::111111111111:saml-provider/my-saml"]
    #   assume_roles           = ["arn:aws:iam::222222222222:role/Viewrole"]
    # }

    # NoAccessRole = {
    #   assumable_by_federated = ["arn:aws:iam::111111111111:saml-provider/my-saml"]
    # }

  }

  tags = {
    Automation = "true"
    Terraform  = "true"
  }
}

module "rds" {
  source = "./modules/rds"

  project_name            = var.project_name
  environment             = var.environment
  aws_account_id          = var.aws_account_id
  aws_region              = var.aws_region
  db_name                 = var.db_name
  engine                  = var.engine
  engine_version          = var.engine_version
  availability_zones      = var.availability_zones
  availability_zone       = var.availability_zone
  username                = var.username
  password                = var.password
  rds_port                = var.rds_port
  allocated_storage       = var.allocated_storage
  storage_type            = var.storage_type
  vpc_subnet_private_1a   = var.vpc_subnet_private_1a
  vpc_subnet_private_1c   = var.vpc_subnet_private_1c
  vpc_subnet_public_1a    = var.vpc_subnet_public_1a
  vpc_subnet_public_1c    = var.vpc_subnet_public_1c
  instance_class          = var.instance_class
  vpc_id                  = var.vpc_id
  maintenance_window      = var.maintenance_window
  backup_window           = var.backup_window
  backup_retention_period = var.backup_retention_period
  apply_immediately       = var.apply_immediately
  skip_final_snapshot     = var.skip_final_snapshot
  multi_az                = var.multi_az
  publicly_accessible     = var.publicly_accessible
  deletion_protection     = var.deletion_protection
  # security_group_id       = module.rds.security_group_id
}