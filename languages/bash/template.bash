#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

#/ Usage:
#/ Description:
#/ Examples:
#/ Options:
#/   --help: Display this help message
usage() { grep '^#/' "$0" | cut -c4- ; exit 0 ; }
expr "$*" : ".*--help" > /dev/null && usage

date_cmd="date \"+%Y-%m-%d %H:%M:%S\""

readonly LOG_FILE="/tmp/$(basename "$0").log"
info()    { echo $(eval "$date_cmd") "[INFO]    $@" | tee -a "$LOG_FILE" >&2 ; }
warning() { echo $(eval "$date_cmd") "[WARNING] $@" | tee -a "$LOG_FILE" >&2 ; }
error()   { echo $(eval "$date_cmd") "[ERROR]   $@" | tee -a "$LOG_FILE" >&2 ; }
fatal()   { echo $(eval "$date_cmd") "[FATAL]   $@" | tee -a "$LOG_FILE" >&2 ; exit 1 ; }

cleanup() {
    # Remove temporary files
    # Restart services
    # ...
    :
}

if [[ "${BASH_SOURCE[0]}" = "$0" ]]; then
    trap cleanup EXIT
    # Script goes here
    # ...
    echo "$(basename "$0")"
    echo "$0"
    info "This is a test of the info command" "info" 
    warning "This is a test of the warning command" "warning" 
    error "This is a test of the error command" "error" 
    fatal "This is a test of the fatal command" "fatal" 
fi
