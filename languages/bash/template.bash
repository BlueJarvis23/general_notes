#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

#/ Author:      Dallin Marshall
#/ Description:
#/ Examples:
#/ Options:
#/   --help: Display this help message

usage() { grep $1 "$0" | cut $2 ; exit 0 ; }
expr "$*" : ".*--help" > /dev/null && usage '^#/' '-c4-'

date_cmd="date \"+%Y-%m-%d %H:%M:%S\""

readonly LOG_FILE="/tmp/$(basename "$0").log"

info()    { echo $(eval "$DATE") "[INFO]    ${FUNCNAME[1]}: $@" | tee -a "$LOG_FILE" >&2 ; }
verbose() { if [[ -n $VERBOSE ]]; then echo $(eval "$DATE") "[VERBOSE] ${FUNCNAME[1]}: $@" | tee -a "$LOG_FILE" >&2 ; fi }
warning() { echo $(eval "$DATE") "[WARNING] ${FUNCNAME[1]}: $@" | tee -a "$LOG_FILE" >&2 ; }
error()   { echo $(eval "$DATE") "[ERROR]   ${FUNCNAME[1]}: $@" | tee -a "$LOG_FILE" >&2 ; }
fatal()   { echo $(eval "$DATE") "[FATAL]   ${FUNCNAME[1]}: $@" | tee -a "$LOG_FILE" >&2 ; exit 1 ; }

info_eval()    { info $@ ; eval $@ ; }
v_eval()       { verbose $@ ; eval $@ ; }

cleanup() {
    # Remove temporary files
    # Restart services
    # ...
#    rm -rf $TMP_DIR
    tail -n 500 $LOG_FILE >> "${LOG_FILE}.new" && mv -f "${LOG_FILE}.new" $LOG_FILE    
    #/u/dmarshall/bin/user_log -u $USER -s $(basename $0)
    :
}

# Commandline Argparse
while [[ $# -gt 0 ]]; do
    case "$1" in
        *)
            fatal "Unknown Commandline Arg: $1"
            ;;
    esac
    shift
done

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

