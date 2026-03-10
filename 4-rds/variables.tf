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
variable "zone_name" {
  type    = string
  default = "daws81s.icu"

}

variable "zone_id" {
  type    = string
  default = "Z07106382R8OPNWZHVRIY"

}