FROM linuxbrew/linuxbrew
MAINTAINER Shaun Jackman <sjackman@gmail.com>

RUN brew tap homebrew/science

RUN brew install cpanm

RUN cpanm --force IO::Prompt

# Failed test 'check that thread1, thread2, and thread3 exited due to cond_broadcast'
RUN cpanm --force forks forks::shared

RUN cpanm Bit::Vector DBD::SQLite DBI File::Which IO::All Inline::C Perl::Unsafe::Signals PerlIO::gzip
RUN cpanm Bio::Perl

ENV PERL5LIB /home/linuxbrew/perl5/lib/perl5
RUN brew install --only-dependencies maker -v
RUN brew install maker -v

ENTRYPOINT ["maker"]
