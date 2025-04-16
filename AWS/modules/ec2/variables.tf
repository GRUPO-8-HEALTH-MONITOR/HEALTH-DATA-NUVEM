variable "subnet_id" {
  description = "Subnet ID where the EC2 instance will be launched"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for Ubuntu OS"
  type        = string
  default     = "ami-00a929b66ed6e0de6"  
}

variable "volume_size" {
  description = "Size of the root volume in GB"
  type        = number
  default     = 8
}

variable "vpc_id" {
  description = "VPC ID where the security group will be created"
  type        = string
}