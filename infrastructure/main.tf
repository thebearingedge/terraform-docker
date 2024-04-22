terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker",
      version = "3.0.2"
    }
  }
}

provider "docker" {
  host = "tcp://docker:2375/"
}

data "docker_registry_image" "ubuntu" {
  name = "registry-1.docker.io/library/ubuntu:24.04"
}

resource "docker_image" "ubuntu" {
  name = data.docker_registry_image.ubuntu.name
  pull_triggers = [
    data.docker_registry_image.ubuntu.sha256_digest
  ]
}
