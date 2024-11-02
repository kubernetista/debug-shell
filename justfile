# Justfile

# Variables
# IMAGE_NAME := "fastapi-uv:latest"

# List 📜 all recipes (default)
help:
    @just --list

# Build the application
build:
    #!/bin/bash
    export IMAGE_TAG=$(git describe --tags --abbrev=4 --always)
    # export IMAGE_TAG=$(date +"%Y%m%d.%H%M%S-%Z")
    docker build . -t debug-shell -t ghcr.io/kubernetista/debug-shell:${IMAGE_TAG}
    # Additional tags
    docker tag debug-shell ghcr.io/kubernetista/debug-shell:latest
    # docker tag debug-shell ghcr.io/kubernetista/debug-shell:${IMAGE_TAG}

# Push the application to GHCR
push:
    #!/bin/bash
    # Get the version from git describe
    export IMAGE_TAG=$(git describe --tags --abbrev=4 --always)
    # push to GHCR
    docker push ghcr.io/kubernetista/debug-shell:latest
    docker push ghcr.io/kubernetista/debug-shell:${IMAGE_TAG}

# Test run the application
test-start:
    docker run --rm -it ghcr.io/kubernetista/debug-shell:latest bash

#  Build and Start the application
build-test-start: build test-start

# Build and Push the application
build-push: build push
