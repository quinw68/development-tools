# development-tools
Tools to help with development

## Prereqs

- Docker
- Visual Studio Code
    - Docker extension (ms-azuretools.vscode-docker)

## Setup

Pull the docker image for the repository

```
docker pull quinw68/node-dev-vscode
```

Run the docker image as a detached container with the current directory mounted as a volume mapped to the /home/node directory of the image.
This mounts a volume of the docker image to the current directory (Windows-specific)

```
docker run --rm -dt -v <local directory>:/home/node/dev quinw68/node-dev-vscode:latest
```

In the docker extension under <b>CONTAINERS</b> right click on the container and choose "Attach Visual Studio Code"

Clone the repository of the project you wish to work on.
