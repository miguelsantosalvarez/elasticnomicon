output "elasticsearch_username" {
  value = ec_deployment.example_minimal.elasticsearch_username
}

output "elasticsearch_password" {
  value = nonsensitive(ec_deployment.example_minimal.elasticsearch_password)
}
