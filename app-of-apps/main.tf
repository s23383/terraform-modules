resource "argocd_repository" "test_deployment_repo" {
  repo = var.repo_url
  name = var.repo_name
  type = "git"
  username = var.repo_username
  password = var.repo_password
  insecure = true
}

resource "argocd_application" "applications" {
  metadata {
    name      = var.application_name
    namespace = var.namespace
  }

  spec {
    project = "default"

    source {
      repo_url        = var.repo_url
      target_revision = "HEAD"
      path            = var.repo_path
    }

    destination {
      server    = "https://kubernetes.default.svc"
      namespace = var.namespace
    }

    sync_policy {
      automated {
        prune = true
        self_heal = true
      }
    }
  }

  depends_on = [argocd_repository.test_deployment_repo]
}
