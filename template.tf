provider "kubernetes" {}

resource "kubernetes_deployment" "postgres" {
  metadata {
    name = "postgres"

    labels {
      app = "postgres"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels {
        app = "postgres"
      }
    }

    template {
      metadata {
        labels {
          app = "postgres"
        }
      }

      spec {
        container {
          image             = "postgres"
          name              = "postgres-container"
          image_pull_policy = "IfNotPresent"

          port = {
            container_port = 5432
          }

          env {
            name  = "POSTGRES_DB"
            value = "my-db"
          }

          env {
            name  = "POSTGRES_PASSWORD"
            value = "password1234"
          }

          env {
            name  = "POSTGRES_USER"
            value = "dimas"
          }
        }
      }
    }
  }
}
