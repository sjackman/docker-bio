FROM linuxbrew/linuxbrew
MAINTAINER Shaun Jackman <sjackman@gmail.com>

# Fix cmake error: libcurl.so: undefined reference to `SSL_get_peer_certificate@OPENSSL_1.0.0'
RUN brew install curl

RUN brew install python # for pip
RUN brew install freetype libpng # for matplotlib
RUN pip install matplotlib # for quast

RUN brew install cpanm
RUN cpanm Log::Log4perl # for meraculous
RUN cpanm Bio::Perl # for velvetoptimiser
ENV PERL5LIB /home/linuxbrew/perl5/lib/perl5

RUN brew tap homebrew/science
RUN brew install a5
RUN brew install abyss
RUN brew install idba
RUN brew install megahit
RUN brew install meraculous
RUN brew install minia
RUN brew install quast
#RUN brew install rampart # error building r
RUN brew install sga
RUN brew install soapdenovo
#RUN brew install spades # mysterious failure: make: *** [all] Error 2
#RUN brew install sparseassembler # Error 404 Not Found
RUN brew install squeezambler
RUN brew install velvet
RUN brew install velvetoptimiser
