variable "USERNAME" {
  default = "app"
}

group "default" {
  targets = ["alpine", "debian", "ubuntu"]
}

target "alpine" {
  dockerfile = "Dockerfile.alpine"
  tags = ["virtualroot/hardened-alpine:3.18"]
  args = {
    image = "alpine:3.18"
    username = "${USERNAME}"
  }
  platforms = ["linux/amd64", "linux/arm64"]
}

target "ubuntu" {
  dockerfile = "Dockerfile.ubuntu"
  tags = ["virtualroot/hardened-ubuntu:22.04"]
  args = {
    image = "ubuntu:22.04"
    username = "${USERNAME}"
  }
}

target "debian" {
  dockerfile = "Dockerfile.debian"
  tags = ["virtualroot/hardened-debian:bookworm"]
  args = {
    image = "debian:bookworm-slim"
    username = "${USERNAME}"
  }
}
