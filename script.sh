#!/bin/bash
chown -R root:docker /var/run/docker.sock
chmod 660 /var/run/docker.sock