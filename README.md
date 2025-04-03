## Collection of scripts to build and check C++ projects using build tools

Collection of bash scripts used for check and build C++ projects using build tools: cmake, vcpkg, conan, cppcheck, clang-format.

## Version

0.1.1

# Usage

Add as submodule

    git submodule init
    git submodule add https://github.com:AlexBurnes/build_scripts.git scripts

# Scripts

* build - build helper scripts, builds project using cmake and packager manager vcpkg or conan if there is settings files for that manager
* cpp-check - run cppcheck on project source codes
* docker-build - run docker build to buid project inside docker container
* mem-check - run valgrind on executable for detect memory leaks
* pre-push - git pre-push hook, run checks on project repositoring on git commit
* style-check - check code style formating using clang-format
* version - get project name and version using git describe, used by other scripts
* version-check - check version set is correct

# Changelog

See [CHANGELOG](CHANGELOG.md)

# License

This scripts is distributed under the [Apache License, Version 2.0](https://www.apache.org/licenses/LICENSE-2.0), see [LICENSE](https://github.com:AlexBurnes/build_scripts/blob/master/LICENSE) for more information.

