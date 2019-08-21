FROM docker.io/alpine:3.10

ENV UID=1337 \
    GID=1337

RUN apk add --no-cache  \
      py3-pillow \
      py3-aiohttp \
      py3-magic \
      py3-sqlalchemy \
      py3-psycopg2 \
      py3-ruamel.yaml \
      # Indirect dependencies
      #commonmark
        py3-future \
      #alembic
        py3-mako \
        py3-dateutil \
        py3-markupsafe \
        py3-six \
      #fbchat
        py3-beautifulsoup4 \
      py3-idna \
      # Other dependencies
      ca-certificates \
      su-exec

COPY . /opt/mautrix-facebook
WORKDIR /opt/mautrix-facebook
RUN pip3 install . && pip3 install --upgrade 'https://github.com/tulir/fbchat-asyncio/tarball/master#egg=fbchat-asyncio'

VOLUME /data

CMD ["/opt/mautrix-facebook/docker-run.sh"]
