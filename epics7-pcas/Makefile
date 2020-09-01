IMAGE_NAME = jalalmostafa/epics-pcas

.PHONY: build
build:
	docker build -t $(IMAGE_NAME):7.0.4 .

.PHONY: test
test:
	docker build -t $(IMAGE_NAME)-candidate .
	IMAGE_NAME=$(IMAGE_NAME)-candidate test/run
