variable "namespace" {
  type = string
}

variable "repo_url" {
  type = string
}

variable "repo_name" {
  type = string
}

variable "repo_username" {
  type = string
}

variable "repo_password" {
  type      = string
  sensitive = true
}

variable "repo_path" {
  type = string
}

variable "application_name" {
  type = string
}
