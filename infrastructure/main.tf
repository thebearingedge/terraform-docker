terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker",
      version = "3.0.2"
    }
  }
}

provider "docker" {
  host = "http://docker:2375"
}

data "docker_image" "ubuntu" {
  name = "ubuntu:24.04"
}
