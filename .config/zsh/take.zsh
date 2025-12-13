# Create directory and cd into it
take() {
  [[ -z "$1" ]] && echo "Usage: take <directory>" && return 1
  mkdir -p "$1" && cd "$1"
}