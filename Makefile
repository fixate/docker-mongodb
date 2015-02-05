all: build

.PHONY: all build push

build:
	docker build -t fixate/mongodb:0.0.3 .

push:
	docker push fixate/mongodb
