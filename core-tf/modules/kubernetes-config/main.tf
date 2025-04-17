resource "kubernetes_horizontal_pod_autoscaler_v2" "hpa" {
  metadata {
    namespace = var.namespace
    name      = var.hpa_name
  }

  spec {
    max_replicas = var.max_replicas

    scale_target_ref {
      kind        = var.target_kind
      name        = var.target_name
      api_version = var.api_version
    }

    metric {
      type = "Resource"
      resource {
        name = "cpu"
        target {
          type                = var.metric_type
          average_utilization = var.metric_value
        }
      }
    }

    # target_cpu_utilization_percentage = 60

  }
}