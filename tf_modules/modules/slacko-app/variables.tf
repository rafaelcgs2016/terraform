variable "vpc_id" {
	type = string
}

variable "subnet_cidr" {
        type = string
}

variable "app_name" {
        type = string
}

variable "app_tags" {
	type = map(string)
	default = {
	Terraform = "impacta"
	Enviromente = "rafael"
}
}


