#!/usr/bin/env bash

start_dir=$(pwd)
for d in */; do
    echo Building images in $d ...

    cd $d

    if [[ $d == 'gateway_service/' ]]; then
        cd docker
        docker image build . --tag=peerprep_gateway_service_api
    else
        chmod 744 build_images.sh
        ./build_images.sh
    fi

    cd $start_dir
done
