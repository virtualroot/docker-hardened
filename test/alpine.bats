setup() {
  docker history virtualroot/hardened-alpine:3.18 >/dev/null 2>&1
}

@test "whoami" {
  run docker run virtualroot/hardened-alpine:3.18 whoami
  [ $status -eq 0 ]
  [ "${lines[0]}" = "app" ]
}

@test "workdir" {
  run docker run virtualroot/hardened-alpine:3.18 pwd
  [ $status -eq 0 ]
  [ "${lines[0]}" = "/app" ]
}
