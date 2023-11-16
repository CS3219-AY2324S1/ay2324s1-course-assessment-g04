# G04 Assignment 5

## Prerequisite

Make sure that the following are installed on your device:

- [NodeJS 18 and NPM](https://nodejs.org/download/release/v18.18.2/)
- [Docker](https://docs.docker.com/engine/install/)

## Deployment

### Warning

We **recommend** purging all Docker images **before** and **after** deployment to prevent image conflicts with our project code and other assignment code.

```bash
docker image rm ghcr.io/cs3219-ay2324s1-g04/peerprep_webpage_service_api
docker image rm ghcr.io/cs3219-ay2324s1-g04/peerprep_webpage_service_api_docker
docker image rm ghcr.io/cs3219-ay2324s1-g04/peerprep_user_service_database_initialiser
docker image rm ghcr.io/cs3219-ay2324s1-g04/peerprep_user_service_api
docker image rm ghcr.io/cs3219-ay2324s1-g04/peerprep_room_service_expired_room_deleter
docker image rm ghcr.io/cs3219-ay2324s1-g04/peerprep_room_service_database_initialiser
docker image rm ghcr.io/cs3219-ay2324s1-g04/peerprep_room_service_api
docker image rm ghcr.io/cs3219-ay2324s1-g04/peerprep_question_service_scheduled_question_deleter
docker image rm ghcr.io/cs3219-ay2324s1-g04/peerprep_question_service_database_initialiser
docker image rm ghcr.io/cs3219-ay2324s1-g04/peerprep_question_service_api
docker image rm ghcr.io/cs3219-ay2324s1-g04/peerprep_matching_service_database_initialiser
docker image rm ghcr.io/cs3219-ay2324s1-g04/peerprep_matching_service_api
docker image rm peerprep_gateway_service_api
docker image rm ghcr.io/cs3219-ay2324s1-g04/peerprep_editor_service_api
docker image rm ghcr.io/cs3219-ay2324s1-g04/peerprep_docs_service_api
docker image rm ghcr.io/cs3219-ay2324s1-g04/peerprep_chat_service_api
docker image rm ghcr.io/cs3219-ay2324s1-g04/peerprep_attempt_history_service_room_event_consumer
docker image rm ghcr.io/cs3219-ay2324s1-g04/peerprep_attempt_history_service_database_initialiser
docker image rm ghcr.io/cs3219-ay2324s1-g04/peerprep_attempt_history_service_api
```

### Deploy

1. Clone this repository.

    ```bash
    git clone --recurse-submodules git@github.com:CS3219-AY2324S1/ay2324s1-course-assessment-g04.git
    ```

2. Navigate to the `assignment_5` directory.

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

5. Build the Docker images using the `docker.sh` script.

    ```bash
    ./build_images.sh
    ```

6. Deploy Docker containers using the `docker.sh` script.

    ```bash
    ./docker.sh up
    ```

7. Access the app from your browser at: http://localhost:9100

### Delete

1. Delete Docker containers using the `docker.sh` script.

    ```bash
    ./docker.sh down
    ```
