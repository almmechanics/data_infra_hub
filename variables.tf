variable "location" {
  description = "Common resource group to target"
  type        = string
  default     = "centralus"
}

variable "instance" {
  type    = number
  default = 0
}

variable "prefix" {
  type    = string
  default = "datainfra"
}

variable "suffix" {
  type    = string
  default = "hub"
}

variable "client_secret" {
  type    = string
  default = "Invalid"
}

variable "client_id" {
  type    = string
  default = "Invalid"

}

variable "subscription_id" {
  type    = string
  default = "Invalid"
}

variable "tenant_id" {
  type    = string
  default = "Invalid"
}

variable "log_retention_days" {
  type    = number
  default = 365
}

variable "vnet_hub" {
  type        = string
  description = "VPC cidr block. Example: 10.10.0.0/16"
  default     = "10.4.0.0/24"
}
