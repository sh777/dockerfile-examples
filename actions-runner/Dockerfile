FROM ghcr.io/actions/actions-runner:latest

RUN sudo apt-get update \
    && sudo apt-get install -y \
    zip \
    && sudo apt-get clean \
    && sudo rm -rf /var/lib/apt/lists/*

