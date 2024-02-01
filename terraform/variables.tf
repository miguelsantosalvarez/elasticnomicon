
# curl -XGET https://api.elastic-cloud.com/api/v1/deployments/templates?region=gcp-europe-west1 -H "Authorization: ApiKey <your_api_key>" > deployment_templates.json
variable "cloud_es_template" {
  description = "machine template"
  default     = "gcp-general-purpose-v7"
}

variable "cloud_region" {
  description = "AWS region, GCP zone, Azure region, etc."
  default     = "gcp-europe-west1"
}

variable "es_size" {
  description = "size in memory for the Elasticsearch instance"
  default     = "2g"
}
variable "kb_size" {
  description = "size in memory for the Kibana instance"
  default     = "1g"
}
variable "zone_count" {
  description = "Number of availability zones to use"
  default     = "1"
}
variable "stack_version" {
  description = "Elastic Stack version to deploy"
  default     = "latest"
}
variable "deployment_name" {
  description = "The name of the deployment"
  default     = "test"
}