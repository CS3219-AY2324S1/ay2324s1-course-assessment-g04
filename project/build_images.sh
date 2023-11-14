#!/usr/bin/env bash

start_dir=$(pwd)
for d in */; do
    cd $d

    ./build_images.sh -p

    cd $start_dir
done
