terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = var.aws_region
}

/*
resource "aws_instance" "app_server" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}
*/

resource "aws_docdb_cluster_instance" "cluster_instances" {
  count              = 1
  identifier         = "docdb-${count.index}"
  cluster_identifier = aws_docdb_cluster.default.id
  instance_class     = "db.t3.medium"
}

resource "aws_docdb_cluster" "default" {
  cluster_identifier = "docdb-cluster-demo"
  availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]
  master_username    = "foo"
  master_password    = "barbut8chars"
  backup_retention_period = 5
  deletion_protection = true
  skip_final_snapshot     = true
}

/*Version 1.1.0*/
