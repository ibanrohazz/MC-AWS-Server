variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "key_name" {
  description = "Name of the AWS key pair to use for SSH access"
  type        = string
}

variable "public_key_path" {
  description = "Path to the SSH public key file (e.g., ~/.ssh/id_rsa.pub)"
  type        = string
}

variable "ssh_cidr_blocks" {
  description = "List of CIDR blocks allowed for SSH access (EC2 Instance Connect ranges)"
  type        = list(string)
}

variable "instance_type" {
  description = "EC2 instance type for the Minecraft server"
  type        = string
  default     = "t4g.small"
}

variable "ebs_volume_size" {
  description = "Size of the root EBS volume (GB)"
  type        = number
  default     = 8
}

variable "minecraft_server_url" {
  description = "URL to download the Minecraft server JAR file"
  type        = string
}

variable "minecraft_port" {
  description = "Port for Minecraft server"
  type        = number
  default     = 25565
}
