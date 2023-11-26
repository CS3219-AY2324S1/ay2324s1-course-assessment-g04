#!/bin/bash

if [[ $1 == up ]]; then
    echo Deploying Docker containers ...
    docker network create -d bridge peerprep
elif [[ $1 == down ]]; then
    echo Deleting Docker containers ...
    echo Deleting in parallel, expect the terminal output to be messy.
else
    echo Please specify the sub-command, "up" or "down"
    echo e.g. ./k8s.sh up
    exit 1
fi

start_dir=$(pwd)
dir_names=(
    user_service
    question_service
    matching_service
    room_service
    editor_service
    chat_service
    attempt_history_service
    docs_service
    webpage_service
    gateway_service/docker
)

pids=()

for k in ${dir_names[@]}; do
    cd $k

    if [[ $1 == up ]]; then
        docker compose up -d
    elif [[ $1 == down ]]; then
        docker compose down &
        pids+=($!)
    fi

    cd ${start_dir}
done

if [[ $1 == down ]]; then
    for pid in "${pids[@]}"; do
        wait "${pid}"
    done

    docker network rm peerprep
fi
