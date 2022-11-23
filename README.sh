# build base
docker build --tag seyoungsong/neko:base --platform linux/arm64 --file Dockerfile.base neko

# build chromium
docker build --tag seyoungsong/neko:chromium --platform linux/arm64 --build-arg="BASE_IMAGE=ghcr.io/seyoungsong/neko:base" --file neko/.docker/chromium/Dockerfile.arm neko/.docker/chromium

# test chromium
docker run -it --rm seyoungsong/neko:chromium --platform linux/arm64 /bin/bash

# https://github.com/seyoungsong/docker-neko/actions/workflows/ci.yml
