FROM nextcloud:34-apache

RUN set -ex; \
    apt-get update && apt-get install -y --no-install-recommends \
    supervisor \
    ffmpeg \
    && rm -rf /var/lib/apt/lists/* 

RUN mkdir -p \
    /var/log/supervisord \
    /var/run/supervisord \
;

COPY supervisord.conf /

ENV NEXTCLOUD_UPDATE=1

CMD ["/usr/bin/supervisord", "-c", "/supervisord.conf"]
