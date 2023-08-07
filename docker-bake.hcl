variable "USERNAME" {
  default = "app"
}

group "default" {
  targets = ["alpine", "debian", "ubuntu"]
}

target "alpine" {
  dockerfile = "Dockerfile.alpine"
  tags = ["virtualroot/hardened-alpine:3.18", "virtualroot/hardened-alpine:3.18-${formatdate("YYYYMMDD", timestamp())}", "virtualroot/hardened-alpine:3.18-${formatdate("YYYYMMDDhhmm", timestamp())}"]
  args = {
    username = "${USERNAME}"
  }
}

target "debian" {
  dockerfile = "Dockerfile.debian"
  tags = ["virtualroot/hardened-debian:12", "virtualroot/hardened-debian:12-${formatdate("YYYYMMDD", timestamp())}", "virtualroot/hardened-debian:12-${formatdate("YYYYMMDDhhmm", timestamp())}"]
  args = {
    username = "${USERNAME}"
  }
}

target "ubuntu" {
  dockerfile = "Dockerfile.ubuntu"
  tags = ["virtualroot/hardened-ubuntu:22.04", "virtualroot/hardened-ubuntu:22.04-${formatdate("YYYYMMDD", timestamp())}", "virtualroot/hardened-ubuntu:22.04-${formatdate("YYYYMMDDhhmm", timestamp())}"]
  args = {
    username = "${USERNAME}"
  }
}
