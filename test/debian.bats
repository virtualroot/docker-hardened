setup() {
  docker history virtualroot/hardened-debian:12 >/dev/null 2>&1
}

@test "whoami app" {
  run docker run virtualroot/hardened-debian:12 whoami
  [ $status -eq 0 ]
  [ "${lines[0]}" = "app" ]
}

@test "uid" {
  run docker run virtualroot/hardened-debian:12 id -g
  [ $status -eq 0 ]
  [ "${lines[0]}" = "12123" ]
}

@test "gid" {
  run docker run virtualroot/hardened-debian:12 id -g
  [ $status -eq 0 ]
  [ "${lines[0]}" = "12123" ]
}

@test "workdir" {
  run docker run virtualroot/hardened-debian:12 pwd
  [ $status -eq 0 ]
  [ "${lines[0]}" = "/app" ]
}

