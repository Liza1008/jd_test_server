variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "eu-west-3"
}

variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "jd-test-server"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "test"
}
