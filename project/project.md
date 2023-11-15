# G04 Project

## Prerequisite

Make sure that the following are installed on your device:

- [NodeJS 18 and NPM](https://nodejs.org/download/release/v18.18.2/)
- [Docker](https://docs.docker.com/engine/install/)
- [Kubectl](https://kubernetes.io/docs/tasks/tools/)
- [Helm](https://helm.sh/docs/intro/install/)
- [Minikube](https://minikube.sigs.k8s.io/docs/start/)

If deploying via Kubernetes make sure you have the public and private key files for decrypting secrets. These files should be uploaded to canvas "Sharing Assignment Private Info" as:
- Public key: `project-peerprep_sealed_secret_tls.crt`
- Private key: `project-peerprep_sealed_secret_tls.key`

Move them into the same directory as this file and rename them as such:
- Rename `Project-peerprep_sealed_secret_tls.crt` to `peerprep_sealed_secret_tls.crt`
- Rename `Project-peerprep_sealed_secret_tls.key` to `peerprep_sealed_secret_tls.key`

## Deployment

### Steps

1. Clone this repository.

    ```bash
    git clone --recurse-submodules git@github.com:CS3219-AY2324S1/ay2324s1-course-assessment-g04.git
    ```

2. Navigate to the `project` directory.

3. Check that the following sub-directories are not empty.
    - `user_service`
    - `question_service`
    - `matching_service`
    - `room_service`
    - `editor_service`
    - `chat_service`
    - `attempt_history_service`
    - `docs_service`
    - `webpage_service`
    - `gateway_service`

4. Should any of the directories be empty, pull the Git submodules.

    ```bash
    git submodule update --init
    ```

5. Refer to either [Deploy Docker](#deploy-docker) or [Deploy Kubernetes](#deploy-kubernetes) depending on which you intend to deploy.

#### Deploy Docker

This is intended for development use only. It is meant to make developing services easier.

**Deploy:**

1. Deploy Docker containers using the `docker.sh` script.
    ```bash
    ./docker.sh up
    ```
2. Access the app from your browser at: http://localhost:9100

**Delete:**

1. Delete Docker containers using the `docker.sh` script.
    ```bash
    ./docker.sh down
    ```

#### Deploy Kubernetes

This is the main deployment method for production.

Although our method of deployment allows for deployment on a Kubernetes cluster hosted on the cloud, here we will only describe how to do so via Minikube.

**Notes:**

- Databases and message brokers are hosted externally on the cloud.
  - Internet connection is needed.
  - Deploying on a Kubernetes cluster running within the NUS school network may not be possible. Last we checked, the NUS school network was blocking one of our databases, MongoDB Atlas cloud.

**Deploy:**

1. Start the Minikube cluster

    ```bash
    minikube start
    ```

2. Setup the Kubernetes cluster.

    ```bash
    ./setup_cluster.sh minikube
    ```

3. Create PeerPrep Kubernetes objects.

    ```bash
    ./k8s.sh up
    ```

4. Check that all pods are running. Please wait until the statuses of all pods are either `Running` or `Completed`.

    ```bash
    kubectl get all -n peerprep
    ```

5. Setup your device to map the domain name `peerprep.us.to` to the output of `minikube ip`.
    1. Get the Minikube IP and record it down. Any mention of `MINIKUBE_IP` here on should be substituted with the output of `minikube ip`.
    2. Setup the mapping:
        - On Linux and MacOS, modify the `/etc/hosts` file by adding a new line:
            ```
            MINIKUBE_IP peerprep.us.to
            ```
        - On Windows, TODO:
    3. Restart your browser for your browser to take this into account.

6. Open a Minikube tunnel.

    ```bash
    minikube tunnel
    ```

7. Access the app from your browser at: http://peerprep.us.to

**Delete:**

1. Delete PeerPrep Kubernetes objects.

    ```bash
    ./k8s.sh down
    ```

## Scripts

Some bash scripts are provided to automate common tasks. Make sure that these scripts have executable permission before running them. The scripts are also written with the expectation that the user will be in the directory containing the script when running the script.

### `update_submodules.sh`

Pulls the master branch of all submodules in the `project` directory.

Remember to run `git add .` and `git commit` after this script has completed to create a commit in this repository which records down the new git submodule commits that are being referenced.

### `build_images.sh`

Builds and pushes all Docker images.

Before running, make sure that `docker` has been set up with the necessary permissions to push to the container registry.

### `docker.sh`

Deploys all services via Docker compose or take down all services deployed via Docker compose.

Must be run with the following format:

```
./docker.sh COMMAND
```

`COMMAND` can be:
- `up` - Deploys all services via Docker compose.
- `down` - Takes down all services deployed via Docker compose.

### `k8s.sh`

Deploys all services via Kubernetes or take down all services deployed via Kubernetes.

This script utilises `kubectl`. Before running, make sure that the correct Kubernetes cluster has been set.

Must be run with the following format:

```
./k8s.sh COMMAND
```

`COMMAND` can be:
- `up` - Deploys all services via Kubernetes.
- `down` - Takes down all services deployed via Kubernetes.

### `setup_cluster.sh`

Sets up a Kubernetes cluster.

This script utilises `kubectl`. Before running, make sure that the correct Kubernetes cluster has been set.

If using Minikube as the cluster, an additional argument needs to be specified.

```
./setup_cluster.sh minikube
```
