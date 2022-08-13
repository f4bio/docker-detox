FROM --platform=$TARGETPLATFORM debian:buster-slim

ARG BUILD_VERSION
ARG BUILD_DATE
ARG DEBIAN_FRONTEND=noninteractive

LABEL org.label-schema.name="f4bio/detox"
LABEL org.label-schema.description="M3U Proxy for Plex DVR and Emby Live TV."
LABEL org.label-schema.url="https://github.com/f4bio/docker-detox"
LABEL org.label-schema.application="detox"
LABEL org.label-schema.build-date=$BUILD_DATE
LABEL org.label-schema.version=$BUILD_VERSION
LABEL org.opencontainers.image.source="https://github.com/f4bio/docker-detox"

COPY detoxrc /app/detoxrc
COPY iso8859_1.tbl /app/iso8859_1.tbl

FROM --platform=$TARGETPLATFORM debian:buster-slim

RUN apt-get --yes update \
  && apt-get --yes install detox

COPY --from=0 /app /app

WORKDIR /out

ENTRYPOINT ["detox", "-f", "/app/detoxrc", "/in/*"]
