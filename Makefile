# Build Linuxbrew Homebrew-science Docker images
# Written by Shaun Jackman

# The Docker Hub repository
r=sjackman/bio

all: build docker-images.png

clean:
	rm -f \
		bwa/image \
		docker-images.png

build: bwa/image

install-deps:
	brew install docker graphviz

push: all
	docker push $r:bwa

.PHONY: all clean install-deps push
.DELETE_ON_ERROR:
.SECONDARY:

%/image: %/Dockerfile
	docker build -t $r:$* $*
	docker images --no-trunc |awk '$$1=="$@" {print $$3}' >$@

docker-images.png:
	docker images --viz |dot -Tpng -o docker-images.png

index.html: README.md docker-images.png
	pandoc -o $@ $<
