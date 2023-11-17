#!/usr/bin/env bash

start_dir=$(pwd)
dir_names=(
    user_service
    question_service
)

for d in ${dir_names[@]}; do
    echo Building images in $d ...

    cd $d

    chmod 744 build_images.sh
    ./build_images.sh

    cd $start_dir
done
