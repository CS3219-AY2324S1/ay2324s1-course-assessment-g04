#!/bin/bash

if [[ $1 == up ]]; then
    echo Deploying Kubernetes objects ...

    kubectl create namespace peerprep

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
        gateway_service
    )

    for k in ${dir_names[@]}; do
        cd $k/kubernetes

        chmod 744 ./deploy.sh
        ./deploy.sh -y

        # Removing this line might get you blocked by GitHub container registry for making too many pull request too quickly
        sleep 30

        cd ${start_dir}
    done
elif [[ $1 == down ]]; then
    echo Deleting Kubernetes objects ...

    kubectl delete namespace peerprep
else
    echo Please specify the sub-command, "up" or "down"
    echo e.g. ./k8s.sh up
    exit 1
fi
