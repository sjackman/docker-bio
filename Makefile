# Build Homebrew-science Docker images using Linuxbrew
# Written by Shaun Jackman

# The Docker Hub repository
u=sjackman

# The tag
t=develop

all: build docker-images.png

clean:
	rm -f */image docker-images.png

build: \
	bwa/image \
	maker/image

install-deps:
	brew install docker graphviz

.PHONY: all clean install-deps
.DELETE_ON_ERROR:
.SECONDARY:

%/image: %/Dockerfile
	docker build -t $u/$*:$t $*
	docker images --no-trunc |awk '$$1 ":" $$2 =="$u/$*:$t" {print $$3}' >$@

docker-images.png:
	docker images --viz |dot -Tpng -o docker-images.png

index.html: README.md docker-images.png
	pandoc -o $@ $<
