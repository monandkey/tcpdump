# Makefile
DOCKER_ENV              ?= DOCKER_BUILDKIT=1
DOCKER_TAG              ?= 1.2
DOCKER_REGISTRY         ?= docker.io
DOCKER_REPOSITORY       ?= monandkey/tcpdump
DOCKER_BUILD_ARGS       ?= --rm

TCPDUMP_IMAGE_NAME      ?= ${DOCKER_REGISTRY}/${DOCKER_REPOSITORY}:${DOCKER_TAG}

build-all: build-tcpdump

.PHONY: build-tcpdump
build-tcpdump: 
	${DOCKER_ENV} docker build ${DOCKER_BUILD_ARGS} \
		--tag ${TCPDUMP_IMAGE_NAME} \
		--file ./Dockerfile \
		--no-cache \
		--build-arg REGISTRY=${DOCKER_REGISTRY} \
		--build-arg REPOSITORY=${DOCKER_REPOSITORY} \
		--build-arg TAG=${DOCKER_TAG} \
		./

# Sample Command
# DOCKER_BUILDKIT=1 docker build --rm \
#   --tag docker.io/monandkey/tcpdump:0.4 \
#   --file ./Dockerfile \
#   --no-cache \
#   ./