variable "amis" {
    type = map
    default = {
        "us-east-1" = "ami-0dba2cb6798deb6d8"
        "us-east-2" = "ami-03657b56516ab7912"
    }
}

variable "cdirs_acesso_remoto" {
    type = list
    default = ["191.32.154.79/32", "192.32.154.79/32"]
}

variable "key_name" {
    default = "terraform-aws"
}

