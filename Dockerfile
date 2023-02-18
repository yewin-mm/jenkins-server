FROM jenkins/jenkins:lts-alpine

USER root

RUN apk update && \
    apk add --no-cache apk-tools curl gnupg && \
    mkdir -p /usr/share/keyrings

# add Docker’s official GPG key
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg


# install Only Docker CLI by using docker binaries, you can check latest docker binaries in here (by date) -> https://download.docker.com/linux/static/stable/x86_64/
# I recommend to install only Docker CLI than install the whole Docker Engine (Docker Daemon + Docker CLI), because we don't need the whole engine and CLI is light weight

ENV DOCKER_VERSION=23.0.0

RUN curl -fsSL https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VERSION}.tgz | tar -xz -C /usr/local/bin --strip-components=1 docker/docker


# install Docker Compose, you can check latest docker compose in here -> https://github.com/docker/compose/releases
ENV DOCKER_COMPOSE_VERSION=v2.16.0
RUN curl -fsSL https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-Linux-x86_64 -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose

# create docker group if it doesn't exist
RUN if ! getent group docker > /dev/null; then addgroup -S docker; fi

# add Jenkins user to Docker group
RUN addgroup jenkins docker

# change back to jenkins user as it's better approach after installing necessary tools with root user as we defined in top of the file
USER jenkins
