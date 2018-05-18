FROM jruby:9.1.12-alpine

# cf.: https://docs.docker.com/docker-cloud/builds/advanced/#environment-variables-for-building-and-testing
ARG SOURCE_COMMIT=unknown
ARG DOCKER_REPO=https://hub.docker.com/r/awesomeinc/elastic_provisioner/
ARG CACHE_TAG=latest
ARG IMAGE_NAME="awesomeinc/elastic_provisioner:latest"

# cf.: https://medium.com/microscaling-systems/labelling-automated-builds-on-docker-hub-f3d073fb8e1
# https://docs.docker.com/docker-cloud/builds/advanced/#override-build-test-or-push-commands
ARG BUILD_DATE=unknown

ARG NAME=elastic_provisioner
ARG DESCRIPTION="Elastic Provisioner"
ARG VENDOR="Awesome Inc"
ARG REPO=https://github.com/awesome-inc/elastic_provisioner

LABEL author="Awesome Incremented <marcel.koertgen@gmail.com>"

# cf.: http://label-schema.org/rc1/
LABEL org.label-schema.build-date="${BUILD_DATE}" \
      org.label-schema.name="${NAME}" \
      org.label-schema.description="${DESCRIPTION}" \
      org.label-schema.usage="${REPO}/blob/master/README.md" \
      org.label-schema.url="${DOCKER_REPO}" \
      org.label-schema.vcs-url="${REPO}" \
      org.label-schema.vcs-ref="${SOURCE_COMMIT}" \
      org.label-schema.vendor="${VENDOR}" \
      org.label-schema.version="${CACHE_TAG}" \
      org.label-schema.schema-version="1.0" \
      org.label-schema.docker.cmd="docker run -d ${IMAGE_NAME}"
# TODO: even more labels...

WORKDIR /app

ADD . ./

CMD bash -c "./provision.sh"
