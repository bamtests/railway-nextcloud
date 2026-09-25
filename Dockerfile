FROM nextcloud:stable

RUN apt-get update && apt-get install -y --no-install-recommends \
    supervisor \
    ffmpeg \
    libmagickcore-7.q16-10-extra \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir /var/log/supervisord /var/run/supervisord; \
    apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false; \
    rm -rf /var/lib/apt/lists/*

COPY supervisord.conf /

ENV NEXTCLOUD_UPDATE=1

CMD ["/usr/bin/supervisord", "-c", "/supervisord.conf"]
