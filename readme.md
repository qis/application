# Application
C++ application project template (similar to <https://github.com/qis/library>).

## Linux
```sh
# Install tools.
sudo apt install build-essential curl git ninja-build pkg-config unzip wget zip

# Install cmake.
sudo rm -rf /opt/cmake; sudo mkdir -p /opt/cmake
wget https://github.com/Kitware/CMake/releases/download/v3.29.6/cmake-3.29.6-linux-x86_64.tar.gz
sudo tar xf cmake-3.29.6-Linux-x86_64.tar.gz -C /opt/cmake --strip-components=1
rm -f cmake-3.29.6-Linux-x86_64.tar.gz

sudo tee /etc/profile.d/cmake.sh >/dev/null <<'EOF'
export PATH="/opt/cmake/bin:${PATH}"
EOF

sudo chmod 0755 /etc/profile.d/cmake.sh
. /etc/profile.d/cmake.sh

# Install vcpkg.
sudo rm -rf /opt/vcpkg; sudo mkdir -p /opt/vcpkg
sudo chown $(id -u):$(id -g) /opt/vcpkg
git clone https://github.com/microsoft/vcpkg /opt/vcpkg
/opt/vcpkg/bootstrap-vcpkg.sh

sudo tee /etc/profile.d/vcpkg.sh >/dev/null <<'EOF'
export VCPKG_ROOT="/opt/vcpkg"
export PATH="${VCPKG_ROOT}:${PATH}"
EOF

sudo chmod 0755 /etc/profile.d/vcpkg.sh
. /etc/profile.d/vcpkg.sh
```

## Windows
1. Install [Visual Studio][vsc].
2. Install [Ninja][nbs] and add it to `%PATH%`.
3. Install [WiX Toolset][wix] to create Windows packages.

## Build
Open the directory as a CMake project in Visual Studio or use [makefile](makefile) commands:

```sh
# Build application.
make # CONFIG=Debug
make CONFIG=Release

# Build and run application.
make run # CONFIG=Debug
make run CONFIG=RelWithDebInfo

# Build and run tests.
make test

# Build and run benchmarks.
make benchmark

# Install application.
make install

# Uninstall application.
make uninstall

# Create package.
make package

# Delete build directory.
make clean
```

## Template
Use template to create a new project.

1. Update `project` in [CMakeLists.txt](CMakeLists.txt).
2. Update `TARGET` in [makefile](makefile).
3. Update `Project Headers` in [.clang-format](.clang-format).
4. Update `dependencies` in [vcpkg.json](vcpkg.json).
5. Update [vcpkg-configuration.json](vcpkg-configuration.json) with `vcpkg x-update-baseline`.
6. Rename [src/application](src/application) to new project name.
7. Update sources and icon in [src](src).
8. Update project and dependency licenses in:
   - [res/license.rtf](res/license.rtf)
   - [res/license.txt](res/license.txt)
   - [license.txt](license.txt)

[vsc]: https://visualstudio.microsoft.com/vs/community
[nbs]: https://github.com/ninja-build/ninja/releases
[wix]: https://github.com/wixtoolset/wix3/releases
