#############################################################################
# REQUIREMENTS
#############################################################################

terraform {
  required_version = "> 1.3"

  required_providers {
    aws = {
      version = "> 4"
    }
  }
}
#############################################################################
# VARIABLES
#############################################################################

variable "region" {
  type        = string
  description = "Région de déploiement"
  default     = "ca-central-1"
}

variable "aws_access_key" {
  type = string
}

variable "aws_secret_key" {
  type = string
}


#############################################################################
# PROVIDERS
#############################################################################

provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key

  #  assume_role {
  #    role_arn     = "arn:aws:iam::${var.account_id}:role/${var.role_name}"
  #    session_name = var.session_name
  #    external_id  = var.external_id
  #  }
}

#############################################################################
# BACKEND
#############################################################################
/*
backend "remote" {
    path = "terraform.tfstate"
  }
}
*/

#############################################################################
# EXEMPLE - RANDOM
#############################################################################

resource "random_id" "exemple" {
  byte_length = 8
}

output "random_exemple" {
  value = random_id.exemple
}
