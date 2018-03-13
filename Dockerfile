FROM ubuntu:xenial
MAINTAINER pascal.lalonde@gmail.com

ARG BAMBOO_SERVER_URL="https://bamboo.taktik.be"
ARG BAMBOO_SERVER_VERSION=6.4.0
ARG BAMBOO_SERVER_TOKEN=""

ENV BAMBOO_INSTALL_DIR /opt/atlassian/bamboo-app
ENV BAMBOO_HOME /opt/atlassian/bamboo-home
ENV BAMBOO_CAPABILITIES_HOME /opt/capabilities
ENV BAMBOO_SERVER_URL ${BAMBOO_SERVER_URL}
ENV BAMBOO_SERVER_VERSION ${BAMBOO_SERVER_VERSION}
ENV BAMBOO_SERVER_TOKEN ${BAMBOO_SERVER_TOKEN}

ADD . /build
RUN chmod +x /build/build.sh && sleep 5 && /build/build.sh

# Define additional metadata for our image.
VOLUME /var/lib/docker
VOLUME $BAMBOO_CAPABILITIES_HOME
VOLUME $BAMBOO_HOME/bamboo-agent.cfg.xml

ENTRYPOINT ["/start.sh"]
CMD [""]
