#!/usr/bin/env bash

throw_error () {
  echo "[error] ${*}" >&2
  exit 1
}

check_not_blank () {
  if [[ -z "$1" ]] ; then
    throw_error "required ${2} argument was blank"
  fi
}

delegate () {
  set -e
  set -o pipefail
  hook_name=$1

  check_not_blank $hook_name "hook_name"

  script_path="$(dirname "$0")/${hook_name}.d"
  cd $script_path

  for hook_script in *; do
    echo "Running ${hook_name} script ${hook_script}..."
    bash $hook_script
    RESULT=$?
    if [ $RESULT != 0 ]; then
      throw_error "${hook_name}.d/$hook_script returned non-zero: $RESULT, abort commit"
    fi
  done

  echo "finished normally"
  exit 0
}
