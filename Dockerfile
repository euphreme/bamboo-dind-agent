FROM ubuntu:14.04
MAINTAINER dl@taktik.be

ADD . /build
RUN chmod +x /build/build.sh && /build/build.sh

# Define additional metadata for our image.
VOLUME /var/lib/docker

ENTRYPOINT ["/start.sh"]
CMD [""]
