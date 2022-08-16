NAME := gollum
REGISTRY := sarlos
TAG := latest
IMAGE := $(REGISTRY)/$(NAME):$(TAG)

build:
	docker build -t $(IMAGE) .

push: build
	docker push $(IMAGE)
