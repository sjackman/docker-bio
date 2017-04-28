Docker image of Homebrew/science bioinformatics software
================================================================================

This Docker image [`sjackman/bioinformatics`](https://registry.hub.docker.com/u/sjackman/bioinformatics/) contains all the bioinformatics formulae in [Homebrew-science](https://github.com/Homebrew/homebrew-science) that have a precompiled binary bottle for [Linuxbrew](http://brew.sh/linuxbrew/). See [bioinformatics/formulae.tsv](formulae.tsv) for a complete list of the included software.

To use it, run...
```sh
docker pull sjackman/bioinformatics
docker run -it sjackman/bioinformatics
brew list
ls /home/linuxbrew/.linuxbrew/bin/
```
