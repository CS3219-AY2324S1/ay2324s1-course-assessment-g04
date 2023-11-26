#!/usr/bin/env bash

start_dir=$(pwd)
for d in */; do
    cd $d

    git checkout assignment-5
    git pull origin assignment-5

    cd $start_dir
done
