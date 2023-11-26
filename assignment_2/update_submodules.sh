#!/usr/bin/env bash

start_dir=$(pwd)
for d in */; do
    cd $d

    git checkout assignment-2
    git pull origin assignment-2

    cd $start_dir
done
