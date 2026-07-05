#!/usr/bin/env sh

SCRIPT_PATH=$(realpath "$0")
SRC_DIR_PATH=$(dirname "$SCRIPT_PATH")
LIB_DIR_PATH="${SRC_DIR_PATH}/lib"

. "${LIB_DIR_PATH}/logging.sh"

main() {
  input_version="${1}"
  input_force="${2}"

  valid_versions="1.1 1.1a 1.2 1.2a 1.2b 1.3 1.3a 1.3b 1.3c 1.3d 1.3e 1.3f"
  found="false"
  for v in ${valid_versions}; do
    if [ "${input_version}" = "${v}" ]; then
      found="true"
      break
    fi
  done
  if [ "${found}" = "false" ]; then
    echo "::error title=Invalid version::Version '${input_version}' is not supported. Valid versions: ${valid_versions}"
    exit 1
  fi

  if [ "${input_force}" != "true" ] && [ "${input_force}" != "false" ]; then
    echo "::error title=Invalid force value::force must be 'true' or 'false', got '${input_force}'"
    exit 1
  fi
}

main "$@"
