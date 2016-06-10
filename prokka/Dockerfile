FROM linuxbrew/linuxbrew
MAINTAINER Shaun Jackman <sjackman@gmail.com>

RUN brew install cpanm
RUN cpanm Bio::Perl XML::Simple
ENV PERL5LIB /home/linuxbrew/perl5/lib/perl5

RUN brew tap homebrew/science

# Install infernal before hmmer to avoid this error:
# exactmatch.c: undefined reference to `fm_getChar'
RUN brew install infernal -v

RUN brew install --only-dependencies prokka -v
RUN brew install prokka -v

ENTRYPOINT ["prokka"]
