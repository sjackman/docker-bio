FROM linuxbrew/linuxbrew
MAINTAINER Shaun Jackman <sjackman@gmail.com>

ENV PERL5LIB /home/linuxbrew/perl5/lib/perl5
RUN brew install cpanm
# For edirect
RUN cpanm HTML::Entities LWP::Simple LWP::Protocol::https

RUN brew tap homebrew/science
