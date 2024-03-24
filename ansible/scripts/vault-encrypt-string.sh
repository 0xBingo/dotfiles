#!/bin/bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

print_usage()
{
cat >&2 <<EOF
Print a vault encrypted string from argument

usage: ${0##*/} "my string"

EOF
}

MY_STRING=$1
[[ -z "$MY_STRING" ]] && print_usage && exit 1

ENCRYPTED=$(ansible-vault encrypt_string "$MY_STRING" --vault-id "${SCRIPT_DIR}/pwd.txt")
echo "$ENCRYPTED"
