## Abstract

Collection of bash scripts used for check and build C++ projects.
Run tools: cmake, conan, cppcheck, clang-format others.

## Version

0.1.0

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
