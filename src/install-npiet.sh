#!/usr/bin/env sh

SCRIPT_PATH=$(realpath "$0")
SRC_DIR_PATH=$(dirname "$SCRIPT_PATH")
LIB_DIR_PATH="${SRC_DIR_PATH}/lib"

. "${LIB_DIR_PATH}/logging.sh"

main() {
  input_version="${1}"
  bin_path="${2}"

  src_file="${SRC_DIR_PATH}/npiet-${input_version}.c"
  if [ ! -f "${src_file}" ]; then
    echo "::error title=Source not found::Source file for version ${input_version} not found: ${src_file}"
    exit 1
  fi

  mkdir -p "${bin_path}"

  case "$(uname)" in
    Darwin|Linux) out_file="${bin_path}/npiet" ;;
    *)            out_file="${bin_path}/npiet.exe" ;;
  esac

  if command -v cc >/dev/null 2>&1; then
    compiler="cc"
  elif command -v gcc >/dev/null 2>&1; then
    compiler="gcc"
  else
    echo "::error title=No C compiler found::Install gcc or cc to compile npiet"
    exit 1
  fi

  png_flags=""
  png_include=""
  png_lib=""
  if command -v pkg-config >/dev/null 2>&1 && pkg-config --exists libpng 2>/dev/null; then
    png_flags="-DHAVE_PNG_H"
    png_include="$(pkg-config --cflags libpng)"
    png_lib="$(pkg-config --libs libpng)"
  elif [ -f /opt/homebrew/include/png.h ]; then
    png_flags="-DHAVE_PNG_H"
    png_include="-I/opt/homebrew/include"
    png_lib="-L/opt/homebrew/lib -lpng"
  elif [ -f /usr/local/include/png.h ]; then
    png_flags="-DHAVE_PNG_H"
    png_include="-I/usr/local/include"
    png_lib="-L/usr/local/lib -lpng"
  elif [ -f /mingw64/include/png.h ]; then
    png_flags="-DHAVE_PNG_H"
    png_include="-I/mingw64/include"
    png_lib="-L/mingw64/lib -lpng"
  elif [ -f /c/msys64/mingw64/include/png.h ]; then
    png_flags="-DHAVE_PNG_H"
    png_include="-I/c/msys64/mingw64/include"
    png_lib="-L/c/msys64/mingw64/lib -lpng"
  fi

  log_info "Compiling npiet ${input_version} from source..."
  # shellcheck disable=SC2086
  "${compiler}" ${png_flags} ${png_include} -o "${out_file}" "${src_file}" ${png_lib}
  log_info "Compiled successfully to ${out_file}"

  echo "${bin_path}" >> "$GITHUB_PATH"

  if [ -d /c/msys64/mingw64/bin ]; then
    echo "C:\\msys64\\mingw64\\bin" >> "$GITHUB_PATH"
  fi
}

main "$@"
