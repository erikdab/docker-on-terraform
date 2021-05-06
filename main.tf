resource "docker_container" "hello_world_app" {
  image = "hello_world_app:latest"
  name  = "hello_world_app"
  restart = "always"
  healthcheck {
    test = ["CMD", "curl", "-f", "http://localhost:8080"]
    interval = "1s"
    retries = 5
  }
  volumes {
    container_path  = "/myapp/app.js"
    host_path = "/Users/erikdab/Code/terraform-examples/docker-on-terraform/app.js"
    read_only = false
  }
  ports {
    internal = 8080
    external = 8080
  }
}

terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}
