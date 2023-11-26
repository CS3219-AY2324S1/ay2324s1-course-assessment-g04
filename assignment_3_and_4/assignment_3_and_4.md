# G04 Assignment 3 & 4

Note that our code may contain many unused components and modules. This is because said components and modules are used in the project but their associated pages and code which utilise them were stripped out for the assignment submission.

## Prerequisite

Make sure that the following are installed on your device:

- [NodeJS 18 and NPM](https://nodejs.org/download/release/v18.18.2/)
- [Docker](https://docs.docker.com/engine/install/)

## Deployment

### Warning

We **recommend** purging all Docker images **before** and **after** deployment to prevent image conflicts with our project code and other assignment code.

```bash
docker image rm ghcr.io/cs3219-ay2324s1-g04/peerprep_user_service_database_initialiser
docker image rm ghcr.io/cs3219-ay2324s1-g04/peerprep_user_service_api
docker image rm ghcr.io/cs3219-ay2324s1-g04/peerprep_question_service_scheduled_question_deleter
docker image rm ghcr.io/cs3219-ay2324s1-g04/peerprep_question_service_database_initialiser
docker image rm ghcr.io/cs3219-ay2324s1-g04/peerprep_question_service_api
```

### Deploy

1. Clone this repository.

    ```bash
    git clone --recurse-submodules git@github.com:CS3219-AY2324S1/ay2324s1-course-assessment-g04.git
    ```

2. Navigate to the `assignment_3_and_4` directory.

3. Check that the following sub-directories are not empty.
    - `user_service`
    - `question_service`
    - `webpage_service`

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

7. Install dependencies for the Webpage Service.

    ```bash
    cd webpage_service
    npm install
    cd ..
    ```

8. Deploy the Webpage Service.

    ```bash
    cd webpage_service
    npm run dev
    ```

9.  Access the app from your browser at: http://localhost:5173

### Delete

1. Stop the Webpage Service in the terminal which is running Webpage Service's `npm run dev` command. You can do so by using the ctrl+c keyboard shortcut or by closing the terminal.

2. Delete Docker containers using the `docker.sh` script.

    ```bash
    ./docker.sh down
    ```
