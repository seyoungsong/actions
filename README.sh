# build base
docker build --tag seyoungsong/neko:base --platform linux/arm64 --file .docker/base/Dockerfile.arm64 .

# build chromium
docker build --tag seyoungsong/neko:chromium --platform linux/arm64 --build-arg="BASE_IMAGE=seyoungsong/neko:base" --file .docker/chromium/Dockerfile.arm .docker/chromium

# test chromium
docker run -it --rm seyoungsong/neko:chromium --platform linux/arm64 /bin/bash

# https://github.com/seyoungsong/docker-neko/actions/workflows/ci.yml
