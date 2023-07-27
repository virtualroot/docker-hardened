setup() {
  docker history ubuntu >/dev/null 2>&1
}

@test "whoami app" {
  run docker run ubuntu whoami
  [ $status -eq 0 ]
  [ "${lines[0]}" = "app" ]
}

@test "workdir" {
  run docker run ubuntu pwd
  [ $status -eq 0 ]
  [ "${lines[0]}" = "/app" ]
}

