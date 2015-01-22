.PHONY: all build riak-container start-cluster test-cluster stop-cluster

all: stop-cluster riak-container start-cluster

DOCKER_NAME := groovenauts/riak
DOCKER_TAG  := 2.0.2-1

UNAME = $(shell uname)
ifeq "$(UNAME)" "Darwin"
SUDO =
else
SUDO = sudo
endif

build riak-container:
	$(SUDO) docker build -t $(DOCKER_NAME):$(DOCKER_TAG) .

start-cluster:
	$(SUDO) ./bin/start-cluster.sh

test-cluster:
	$(SUDO) ./bin/test-cluster.sh

stop-cluster:
	$(SUDO) ./bin/stop-cluster.sh
