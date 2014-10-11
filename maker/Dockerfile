FROM sjackman/linuxbrew
MAINTAINER Shaun Jackman <sjackman@gmail.com>

RUN brew tap homebrew/science
RUN brew tap homebrew/versions

RUN brew install cpanm
RUN cpanm --force IO::Prompt
RUN cpanm Bit::Vector DBD::SQLite DBI File::Which IO::All Inline::C Perl::Unsafe::Signals PerlIO::gzip forks forks::shared
RUN cpanm Bio::Perl

ENV PERL5LIB /home/linuxbrew/perl5/lib/perl5
RUN brew install --only-dependencies maker
RUN brew install maker

ENTRYPOINT ["maker"]
