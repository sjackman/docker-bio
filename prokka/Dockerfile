FROM sjackman/linuxbrew
MAINTAINER Shaun Jackman <sjackman@gmail.com>

RUN brew install cpanm
RUN cpanm Bio::Perl
ENV PERL5LIB /home/linuxbrew/perl5/lib/perl5

RUN brew tap homebrew/science
RUN brew install --only-dependencies prokka -v
RUN brew install prokka -v

ENTRYPOINT ["prokka"]
