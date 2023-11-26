#!/usr/bin/env bash

start_dir=$(pwd)
for d in */; do
    cd $d

    git checkout assignment-3
    git pull origin assignment-3

    cd $start_dir
done
