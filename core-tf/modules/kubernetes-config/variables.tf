variable "hpa_name" {
  type = string
}

variable "namespace" {
  type    = string
  default = "default"
}

variable "max_replicas" {
  type = number
}

variable "target_name" {
  type = string
}

variable "target_kind" {
  type    = string
  default = "Deployment"
}

variable "api_version" {
  type = string
}

variable "metric_type" {
  type    = string
  default = "Utilization"
}

variable "metric_value" {
  type    = number
  default = 60
}