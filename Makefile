OMD_COMPONENT := clone-db

build: ## Build project
	go build -v -o $(OMD_COMPONENT)
.PHONY: build

build-docker:
	docker build . -t $(OMD_COMPONENT):latest
.PHONY: build-docker 

run-docker:
	docker-compose up -d
.PHONY: run-docker
