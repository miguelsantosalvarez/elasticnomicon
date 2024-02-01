resource "ec_deployment_traffic_filter" "allow_all" {
  name   = "Allow all ip addresses"
  region = var.cloud_region
  type   = "ip"

  rule {
    source = "0.0.0.0/0"
  }
}

