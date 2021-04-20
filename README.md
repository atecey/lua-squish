# lua-squish
A Docker image for squishing Lua code

This project is designed to be used as a base image for minifying and compiling Lua bytecode. It can also be ran as a docker image with mounted volumes to do the same.

## Build

    docker build -t atecey01/lua-squish:latest .


## Usage
To Squish Lua code your project must have a `squishy` file which will be mounted into the `build` directory. You can use the `squshy_file_example` as a reference. Your source code must also be present in the build directory.

    docker run -v ${PWD}:/build atecey01/lua-squish:latest
