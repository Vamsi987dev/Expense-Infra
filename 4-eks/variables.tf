variable "project_name" {
  default = "expense"
  type    = string
}
variable "environment" {
  default = "dev"
  type    = string
}

variable "common_tags" {
  default = {
    Project     = "Expense"
    Environment = "Dev"
    Terraform   = "True"
  }
}

variable "eks_public_key" {
  type        = string
  description = "Public SSH key for EKS nodes"
}