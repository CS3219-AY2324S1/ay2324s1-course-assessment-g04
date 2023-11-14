#!/usr/bin/env bash

start_dir=$(pwd)
for d in */; do
    cd $d

    git pull origin master

    cd $start_dir
done
