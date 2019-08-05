# bumpup version here.
VERSION            := 1.0
BASE_IMAGE         := docker
DOCKER_VERSION     := 18.09
DOCKER_IMAGE       := $(BASE_IMAGE):$(DOCKER_VERSION)
SKAFFOLD_VERSION   := v0.34.0
KUBECTL_VERSION    := v1.15.0
USER               := makotow

# container image name and repository information
IMAGE_NAME         := skaffold-docker
TAG                := $(VERSION)-$(SKAFFOLD_VERSION)
REGISTRY           := $(USER)/$(IMAGE_NAME)

## Shortcuts
bi: build-image
pi: push-image

## docker image build & push
.PHONY: build-image
build-image:
	docker build \
	--build-arg VERSION=$(VERSION) \
	--build-arg DOCKER_IMAGE=$(DOCKER_IMAGE) \
	--build-arg SKAFFOLD_VERSION=$(SKAFFOLD_VERSION) \
	--build-arg KUBECTL_VERSION=$(KUBECTL_VERSION) \
	-t $(REGISTRY):$(TAG) .

.PHONY: push-image
push-image:
	docker push \
	$(REGISTRY):$(TAG) 
