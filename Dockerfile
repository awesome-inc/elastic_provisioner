FROM jruby:9.1.17.0-jre-alpine

# cf.: https://docs.docker.com/docker-cloud/builds/advanced/#environment-variables-for-building-and-testing
ARG DOCKER_REPO
ARG CACHE_TAG
ARG IMAGE_NAME

# cf.: https://medium.com/microscaling-systems/labelling-automated-builds-on-docker-hub-f3d073fb8e1
# https://docs.docker.com/docker-cloud/builds/advanced/#override-build-test-or-push-commands
ARG VCS_REF=unknown
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
      org.label-schema.vcs-ref="${VCS_REF}" \
      org.label-schema.vendor="${VENDOR}" \
      org.label-schema.version="${CACHE_TAG}" \
      org.label-schema.schema-version="1.0" \
      org.label-schema.docker.cmd="docker run -d ${IMAGE_NAME}"
# TODO: even more labels...

WORKDIR /app

ADD . ./

ENTRYPOINT [ "ruby" ]

CMD [ "provision.rb" ]
