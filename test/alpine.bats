setup() {
  docker history virtualroot/hardened-alpine:3.18 >/dev/null 2>&1
}

@test "whoami" {
  run docker run virtualroot/hardened-alpine:3.18 whoami
  [ $status -eq 0 ]
  [ "${lines[0]}" = "app" ]
}

@test "uid" {
  run docker run virtualroot/hardened-alpine:3.18 id -g
  [ $status -eq 0 ]
  [ "${lines[0]}" = "12123" ]
}

@test "gid" {
  run docker run virtualroot/hardened-alpine:3.18 id -g
  [ $status -eq 0 ]
  [ "${lines[0]}" = "12123" ]
}

@test "workdir" {
  run docker run virtualroot/hardened-alpine:3.18 pwd
  [ $status -eq 0 ]
  [ "${lines[0]}" = "/app" ]
}
