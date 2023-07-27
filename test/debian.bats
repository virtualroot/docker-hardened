setup() {
  docker history virtualroot/hardened-debian:bookworm >/dev/null 2>&1
}

@test "whoami app" {
  run docker run virtualroot/hardened-debian:bookworm whoami
  [ $status -eq 0 ]
  [ "${lines[0]}" = "app" ]
}

@test "workdir" {
  run docker run virtualroot/hardened-debian:bookworm pwd
  [ $status -eq 0 ]
  [ "${lines[0]}" = "/app" ]
}

