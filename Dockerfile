# use alpine image for light weight and size reducing
FROM jenkins/jenkins:lts-alpine

# run with root user to install below docker cli and compose and adding user to group
USER root

RUN apk update && \
    apk add --no-cache apk-tools curl gnupg && \
    mkdir -p /usr/share/keyrings

# install shadow in alpine linux to run below usermod command
RUN apk --no-cache add shadow

# add Docker’s official GPG key
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg


# I installed docker in Jenkins for pushing, pulling images to docker hub
# install Only Docker CLI by using docker binaries, you can check latest docker binaries in here (by date) -> https://download.docker.com/linux/static/stable/x86_64/
# I recommend to install only Docker CLI than install the whole Docker Engine (Docker Daemon + Docker CLI), because we don't need the whole engine and CLI is light weight

ENV DOCKER_VERSION=23.0.0
RUN curl -fsSL https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VERSION}.tgz | tar -xz -C /usr/local/bin --strip-components=1 docker/docker



# install Docker Compose for some operations which might need docker compose file, you can check latest docker compose in here -> https://github.com/docker/compose/releases

ENV DOCKER_COMPOSE_VERSION=v2.16.0
RUN curl -fsSL https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-Linux-x86_64 -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose


# create docker group if it doesn't exist
RUN if ! getent group docker > /dev/null; then addgroup --gid 1001 docker; fi

# add user id to user jenkins
RUN usermod -u 1001 -g 1001 jenkins

# add Jenkins user to Docker group to use docker cli to access docker hub
# this is recommended way to give access to docker socket file.
# never give permission like 777, 755 to dokcer socket file as anyone can access your file
# so, adding jenkins user to docker group and change group ownership to docker group as only docker group member can access docker socket file
RUN usermod -aG docker jenkins

# copy script file to container to giving permission and change docker group after restarting docker desktop
# you can find script file under this directory
COPY script.sh /

# change owner of group to jenkins_home
RUN chown -R 1001:1001 /var/jenkins_home

# change back to jenkins user as it's better approach after installing necessary tools with root user as we defined in top of the file
USER jenkins
