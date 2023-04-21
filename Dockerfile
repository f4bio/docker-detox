FROM debian:buster-slim

ARG BUILD_VERSION
ARG BUILD_DATE
ARG DEBIAN_FRONTEND=noninteractive

LABEL org.label-schema.name="f4bio/detox"
LABEL org.label-schema.description="Detox is a utility designed to clean up filenames. It replaces difficult to work with characters, such as spaces, with standard equivalents. It will also clean up filenames with UTF-8 or Latin-1 (or CP-1252) characters in them."
LABEL org.label-schema.url="https://github.com/f4bio/docker-detox"
LABEL org.label-schema.application="detox"
LABEL org.label-schema.build-date=$BUILD_DATE
LABEL org.label-schema.version=$BUILD_VERSION
LABEL org.opencontainers.image.source="https://github.com/f4bio/docker-detox"

RUN apt-get --quiet --yes update && apt-get --quiet --yes install detox

COPY detoxrc /detoxrc
COPY iso8859_1.tbl /iso8859_1.tbl

WORKDIR /data

ENTRYPOINT ["detox"]
CMD ["-r", "-f", "/detoxrc", "*"]
