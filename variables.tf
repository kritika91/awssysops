#region
variable "region" {
  type    = string
  default = "us-east-1"
}
#ami id
variable "ami_id" {
  type = string
  default = "ami-0e472ba40eb589f49"
}
#instance type
variable "instance_type" {
  type    = string
  default = "t2.micro"
}
#existing key-pair name
variable "key_name" {
  type    = string
  default = "awsprjct"
}
# public subnet id
variable "publicsubnetid" {
  type    = string
  default = "subnet-0f3e94091ecc14c1a"
}
#private subnet id
variable "privatesubnetid" {
  type    = string
  default = "subnet-094ff592d84e7d328"
}
#vpc id
variable "vpcid" {
  type    = string
  default = "vpc-07d2ed791995c2677"
}

variable "http_port" {
  description = "The port to use for HTTP traffic. Defaults to 80"
  default = "80"
}

variable "https_port" {
  description = "The port to use for HTTPS traffic. Defaults to 443"
  default = "443"
}


variable "instance_tenancy" {
  description = "A tenancy option for instances launched into the VPC"
  type        = string
  default     = "default"
}

variable "enable_dns_hostnames" {
  description = "Should be true to enable DNS hostnames in the VPC"
  type        = bool
  default     = true
}

variable "enable_dns_support" {
  description = "Should be true to enable DNS support in the VPC"
  type        = bool
  default     = true
}

variable "enable_classiclink" {
  description = "Should be true to enable ClassicLink for the VPC. Only valid in regions and accounts that support EC2 Classic."
  type        = bool
  default     = false
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = string
  default     = "Vpc-custom-demo"
}