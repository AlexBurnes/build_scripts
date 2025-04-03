#!/usr/bin/env bash
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
source "$(dirname "$(readlink -f "$0")")"/functions.sh

########################################################################################################################
# Global variables"

VERSION="0.1.0"

# use commit number as relase: 0 - do not use (default relase number is 1), 1 - use commit number as release number
RELEASE=0

########################################################################################################################
# Help usage

function help {
cat <<EOF
${SCRIPT_NAME} ${VERSION} describe project version and release using git describe command

Usage: 
    ${SCRIPT_NAME} [-h|--help] [-v|--version] [-r|--release] project|version|release|full

Options: 
    -h|--help           print this help and exit
    -V|--version        print script version and exit
    -v|--verbose        verbose output, bash debug
    -d|--debug          debug output
    --no-color          no color output
    -r|--release        use commit number as release number, default is no and relase is 1

Commands:
    project             print project name
    module              print module name
    version             print projecet version
    release             print project release
    full                print full project name-version-release
EOF
}

########################################################################################################################
# Parse command line options

function parse_cmd_args() {

    while :; do
        case "${1-}" in
            -h|--help)
                help
                exit 0
                ;;
            -V)
                lg "${VERSION}"
                exit 0
                ;;
            --version)
                lg "${SCRIPT_NAME} ${VERSION}"
                exit 0
                ;;
            -v|--verbose)
                set -x
                ;;
            -d|--debug)
                DEBUG=1
                ;;
            --no-color)
                NO_COLOR=1
                setup_colors
                ;;
            -r|--release)
                RELEASE=1
                ;;
            version)
               version
               exit 0
                ;;
            project)
               project
               exit 0
                ;;
            module)
               module
               exit 0
                ;;
            release)
               release
               exit 0
                ;;
            full)
               full
               exit 0
               ;;
            -?*)
               le "unknown option: ${1-}"
               exit 1
               ;;
            *)
               le "wrong options"
               lg "usage: version module|project|version|release|full"
               break ;;
        esac
        shift
    done
    exit 1
}

########################################################################################################################
# Script functions

function version {
    local _version=$(git describe --match 'v[0-9]*' --abbrev=0 --tags HEAD | sed -e 's/^v//' \
        | sed -E 's/^([0-9]+\.[0-9]+\.[0-9]+)\-/\1\~/')
    if [[ -z "${_version}" ]]; then
        le "failed to get version, returns nothing from git describe"
        exit 1
    fi
    lg ${_version}
}

function project() {
    git remote -v | grep fetch | awk '{print $2}' | awk -F ':' '{print $2}' | sed 's/\//\-/g' | sed 's/.git//'
}

function module() {
    basename $(git remote -v | grep fetch | awk '{print $2}' | awk -F ':' '{print $2}' | sed 's/.git//')
}

function release() {
    if [[ ${RELEASE} -eq 1 ]]; then
        git describe --match "v[0-9]*" --abbrev=2 --tags HEAD | sed -r 's/\-g[a-f0-9]+$//' \
            | awk -F '-' '{if (NF > 1) print $NF; else print 0;}'
        return 0
    fi
    echo 1
}

function full() {
    version_="$(version)"
    project_="$(project)"
    release_="$(release)"
    lg ${project_}-${version_}-${release_}
}

########################################################################################################################
# Main 

parse_cmd_args "$@"

########################################################################################################################
########################################################################################################################