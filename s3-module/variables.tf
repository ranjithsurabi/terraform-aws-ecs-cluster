variable "bucket_name" {
  type        = string
  description = "Name of the Bucket"
}
variable "force_destroy" {
  type        = bool
  description = "bool to indicate all object to delete"
}
variable "encryption" {
  type        = string
  description = "The type of the encrption used"
  default     = "AES256"
}
variable "kms_master_key_id" {
  type        = string
  description = "KMS encrption ARN"
  default     = null
}
variable "appname" {
  description = "Name of the Application"
  default     = "pe"
}
variable "env" {
  description = "Environment for deployment"
  default     = "dev"
}
variable "domain" {
  description = "Domain Name"
  default     = "PE"
}
variable "teamname" {
  description = "Team Name"
  default     = "PE"
}
variable "region" {
  description = "Region"
  default     = "us-east-2"
}