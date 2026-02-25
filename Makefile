.DEFAULT_GOAL := onboard
.PHONY: onboard
all: build-nodejs build-openclaw build-onboard build-gateway

build-nodejs:
	docker build -t nodejs -f Dockerfile.nodejs .

build-openclaw: build-nodejs
	docker build --build-arg VERSION=latest -t openclaw -f Dockerfile.openclaw .

build-onboard: build-openclaw
	docker build -t onboard -f Dockerfile.onboard .

build-gateway: build-openclaw
	docker build -t gateway -f Dockerfile.gateway .

onboard: build-onboard
	docker run -v `pwd`/config/openclaw:/home/app/.openclaw --rm -it onboard

gateway: build-gateway
	docker run -p18789:18789 -v `pwd`/config/openclaw:/home/app/.openclaw --rm -it gateway

compose: build-onboard build-gateway
	docker compose up

dashboard:
	docker exec -it openclaw-gateway openclaw dashboard

devices:
	docker exec -it openclaw-gateway openclaw devices list

approve:
	docker exec -it openclaw-gateway openclaw devices approve --latest

openclaw:
	docker exec -it openclaw-gateway openclaw
