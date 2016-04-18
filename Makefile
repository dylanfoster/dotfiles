.PHONY: all build test

all: build test

build:
	docker build -t dylanfoster/dotfiles .

test:
	docker run --rm -it dylanfoster/dotfiles
