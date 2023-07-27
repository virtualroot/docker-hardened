setup() {
  docker history virtualroot/hardened-ubuntu:22.04 >/dev/null 2>&1
}

@test "whoami app" {
  run docker run virtualroot/hardened-ubuntu:22.04 whoami
  [ $status -eq 0 ]
  [ "${lines[0]}" = "app" ]
}

@test "workdir" {
  run docker run virtualroot/hardened-ubuntu:22.04 pwd
  [ $status -eq 0 ]
  [ "${lines[0]}" = "/app" ]
}

