# Collection of scripts to build and check C++ projects using build tools
# Copyright 2025 AlexBurnes@gmail.com
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# bash script with common definitions and functions
# usage: source "$(dirname "$(readlink -f "$0")")"/functions.sh
# WARN, script will exit on every error, if script handle errors on every command set +e at start of script

set -o errexit
set -o nounset

PWD=$(pwd -P)
SCRIPT="$(readlink -f "$0")"
SCRIPT_NAME=$(basename "${SCRIPT}")
SCRIPT_PATH="$(dirname "${SCRIPT}")"
PROJECT_DIR="${PWD}"

trap cleanup_ SIGINT SIGTERM EXIT
cleanup_() {
    rc=$?
    trap - SIGINT SIGTERM EXIT
    set +e
    [[ "$(type -t cleanup)" == "function" ]] && cleanup
    if [[ "${rc}" -ne 0 ]]; then
        if [[ "${BASH_COMMAND-}" != "exit ${rc}" ]]; then
            echo >&2 -e "script '${SCRIPT}' failed on '${BASH_COMMAND-}', exit code ${rc}"
        fi
    fi
    cd "${PWD}"
    exit $rc
}



########################################################################################################################
# setup colors

if [[ -t 2 ]] && [[ -z "${NO_COLOR-}" ]] && [[ "${TERM-}" != "dumb" ]]; then
    clre='\e[0m' black='\e[30m' red='\e[31m' green='\e[32m' yellow='\e[33m' blue='\e[34m' magenta='\e[35m' cyan='\e[36m' 
    gray='\e[37m' white='\e[38m' bold='\e[1m' blink='\e[5m]'
else
    clre='' black='' red='' green='' yellow='' blue='' magenta='' cyan='' gray='' white='' bold='' blink=''
fi


########################################################################################################################
# Output colored functions

ok() {
    printf " ${green}${bold}ok${clre}"
}

fail() {
    printf " ${red}${bold}failed${clre} ${1-}"
}

warn() {
    printf " ${purple}${1-}${clre}"
}

error() {
    printf "${red}${bold}${1-}${clre}"
}

########################################################################################################################
# Logging functions

lg() {
    echo -e "${1-}"
}

le() {
    echo >&2 -e "${red}${bold}ERROR${clre}${red}: ${1-}${clre}"
}

lw() {
    echo -e "${purple}WARNING: ${1-}${clre}"
}

ld() {
    if [[ ! -z "${DEBUG-}" && "${DEBUG}" -gt 0 ]]; then
        echo -e "${yellow}${bold}#DEBUG${clre}${yellow}: ${1-}${clre}"
    fi
}
lr() {
    echo -e "${blue}${bold}${1-}${clre}"
}

########################################################################################################################
# Die

die() {
    le "$1"
    exit "${2-1}"
}
