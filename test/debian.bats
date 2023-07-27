setup() {
  docker history debian >/dev/null 2>&1
}

@test "whoami app" {
  run docker run debian whoami
  [ $status -eq 0 ]
  [ "${lines[0]}" = "app" ]
}

@test "workdir" {
  run docker run debian pwd
  [ $status -eq 0 ]
  [ "${lines[0]}" = "/app" ]
}

