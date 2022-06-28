
# Variable

variable "vpc-cidr" {
  type        = string
  description = "name of  vpc cidr"
  default     = "10.0.0.0/20"
}


variable "public-subnet1-cidr" {
  type        = string
  description = "name of  public subnet1 cidr"
  default     = "10.0.12.0/24"
}

variable "public-subnet2-cidr" {
  type        = string
  description = "name of  public subnet2 cidr"
  default     = "10.0.13.0/24"
}

variable "public-subnet3-cidr" {
  type        = string
  description = "name of  public subnet3 cidr"
  default     = "10.0.14.0/24"
}

variable "private-subnet1-cidr" {
  type        = string
  description = "name of  private subnet1 cidr"
  default     = "10.0.15.0/24"
}

variable "private-subnet2-cidr" {
  type        = string
  description = "name of  private subnet2 cidr"
  default     = "10.0.1.0/24"
}

variable "az1" {
  type        = string
  description = "name of  availability zone"
  default     = "eu-west-2a"
}

variable "az2" {
  type        = string
  description = "name of  availability zone"
  default     = "eu-west-2b"
}

variable "az3" {
  type        = string
  description = "name of  availability zone"
  default     = "eu-west-2c"
}


variable "az4" {
  type        = string
  description = "name of  availability zone"
  default     = "eu-west-2a"
}

variable "az5" {
  type        = string
  description = "name of  availability zone"
  default     = "eu-west-2b"
}

variable "route-table" {
  type        = string
  description = "name of the route table"
  default     = "0.0.0.0/0"
}

variable "region" {
  type        = string
  description = "name of region"
  default     = "eu-west-2"
}
