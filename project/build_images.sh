#!/usr/bin/env bash

start_dir=$(pwd)
for d in */; do
    echo Building images in $d ...

    cd $d

    chmod 744 build_images.sh
    ./build_images.sh -p

    cd $start_dir
done
