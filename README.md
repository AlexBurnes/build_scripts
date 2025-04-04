## Collection of scripts to build and check C++ projects using build tools

Collection of bash scripts used for checking and building C++ projects with build tools such as
[CMake](https://cmake.org/cmake/help/latest/), [vcpkg](https://vcpkg.io/), [Conan](https://conan.io/center),
[CppCheck](http://cppcheck.net/), and [ClangFormat](https://clang.llvm.org/docs/ClangFormat.html).

## Version

0.1.2

# Usage

Add as a submodule

    git submodule init
    git submodule add https://github.com:AlexBurnes/build_scripts.git scripts

# Scripts

* **build**: A build helper script that uses [CMake](https://cmake.org/cmake/help/latest/) and package managers like
[vcpkg](https://vcpkg.io/) or [Conan](https://conan.io/center) when available based on configuration files.
* **cpp-check**: Run [CppCheck](http://cppcheck.net/) on your project's source codes.
* **docker-build**: Builds the project within a [Docker](https://docs.docker.com/) container.
* **mem-check**: Uses [Valgrind](https://valgrind.org/docs/manual/manual.html) to detect memory leaks in an executable.
* **pre-push**: A Git pre-push hook that runs checks before pushing changes to a repository.
* **style-check**: Checks code formatting using ClangFormat.
* **version**: Retrieves the project name and version using git describe, utilized by other scripts.
* **version-check**: Verifies whether the version has been properly set.

# Changelog

For detailed change history, see [CHANGELOG](CHANGELOG.md)

# License

This scripts is distributed under the [Apache License, Version 2.0](https://www.apache.org/licenses/LICENSE-2.0),
see [LICENSE](https://github.com:AlexBurnes/build_scripts/blob/master/LICENSE) for more information.

