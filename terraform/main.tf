data "ec_stack" "latest" {
  version_regex = var.stack_version
  region        = var.cloud_region
}

resource "ec_deployment" "example_minimal" {
  name                   = var.deployment_name 
  region                 = var.cloud_region
  version                = data.ec_stack.latest.version
  deployment_template_id = var.cloud_es_template

  elasticsearch = {
    autoscale = "true"
    # If `autoscale` is set, all topology elements that
    # - either set `size` in the plan or
    # - have non-zero default `max_size` (that is read from the deployment templates's `autoscaling_max` value)
    # have to be listed even if their blocks don't specify other fields beside `id`
    hot = {
      size = var.es_size
      zone_count  = var.zone_count

      autoscaling = {
        max_size          = "8g"
        max_size_resource = "memory"
      }
    }
  }

  # Initial size for `hot_content` tier is set to 8g
  # so `hot_content`'s size has to be added to the `ignore_changes` meta-argument to ignore future modifications that can be made by the autoscaler
  lifecycle {
    ignore_changes = [
      elasticsearch.hot.size
    ]
  }
  kibana = {
    size        = var.kb_size
    zone_count  = var.zone_count
  }
}