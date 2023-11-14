# G04 Project

## Prerequisites

Tools required:
- NodeJS
- NPM
- Docker
- Kubectl
- Helm

## Scripts

Some bash scripts are provided to automate common tasks. Make sure that these scripts have executable permission before running them. The scripts are also written with the expectation that the user will be in directory containing the script when running the script.

### `update_submodules.sh`

Pulls the master branch of all submodules in the `project` directory.

Remember to run `git add .` and `git commit` after this script has completed to create a commit in this repository which records down the new git submodule commits that are being referenced.

This script currently does not pull Chat Service as it does not have a `master` branch

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
