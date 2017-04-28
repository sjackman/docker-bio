# Build Homebrew-science Docker images using Linuxbrew
# Written by Shaun Jackman

# The Docker Hub repository
u=sjackman

# The tag
t=develop

all: build docker-images.png

clean:
	rm -f */image docker-images.gv docker-images.png

build: \
	abyss/image \
	assemblers/image \
	bioinformatics/image \
	bwa/image \
	maker/image \
	prokka/image \
	samtools/image

install-deps:
	brew install docker graphviz

.PHONY: all clean install-deps
.DELETE_ON_ERROR:
.SECONDARY:

%/image: %/Dockerfile
	docker build -t $u/$*:$t $*
	docker images --no-trunc |awk '$$1 ":" $$2 =="$u/$*:$t" {print $$3}' >$@

docker-images.gv:
	docker images --viz >$@

%.png: %.gv
	dot -Tpng -o docker-images.png $<

index.html: README.md docker-images.png
	pandoc -o $@ $<

# Bioinformatics

bioinformatics/homebrew-science/README.md:
	git clone --depth=1 https://github.com/Homebrew/homebrew-science

%/tagged.files: %/homebrew-science/README.md
	grep -lF 'tag "$*"' $(<D)/*.rb >$@

%/formulae.tsv: %/tagged.files
	( printf "Formula\tLinux_bottle\n"; \
		egrep -c 'sha256 ".*" => :x86_64_linux$$|bottle :unneeded$$' `<$<` \
			| gsed 's~.*/~~; s/\.rb:0$$/\tFALSE/; s/\.rb:1$$/\tTRUE/') >$@

%/formulae.Dockerfile: %/formulae.tsv
	awk 'NR > 1 { print ($$2 == "TRUE" ? "" : "# ") "RUN brew install " $$1}' $< >$@

%/Dockerfile: %/header.Dockerfile %/formulae.Dockerfile
	cat $^ >$@
