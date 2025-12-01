terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "evm_node" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = var.instance_type
  
  user_data = file("${path.module}/user-data.sh")
  
  tags = {
    Name = "dual-layer-evm-node"
  }
}

resource "aws_security_group" "evm_node_sg" {
  name = "evm-node-sg"
  
  ingress {
    from_port   = 8545
    to_port     = 8546
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
