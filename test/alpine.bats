setup() {
  docker history alpine >/dev/null 2>&1
}

@test "whoami" {
  run docker run alpine whoami
  [ $status -eq 0 ]
  [ "${lines[0]}" = "app" ]
}

@test "workdir" {
  run docker run alpine pwd
  [ $status -eq 0 ]
  [ "${lines[0]}" = "/app" ]
}
