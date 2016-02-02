DOCKER_ENV="$HOME/.dockerenv"
DOCKER_MACHINE_NAME="default"

denv() {
  eval "$(cat $DOCKER_ENV)"
}

dstart() {
  docker-machine start $DOCKER_MACHINE_NAME
  docker-machine env $DOCKER_MACHINE_NAME > $DOCKER_ENV
}

dkill() {
  docker-machine kill $@
}

dlist() {
  docker-machine ls
}

if [[ -f $DOCKER_ENV ]]; then
  denv
fi
