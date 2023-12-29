ARG VERSION=latest
FROM squidfunk/mkdocs-material:${VERSION}

RUN apk add font-ipa fontconfig && fc-cache -f

# https://doc.courtbouillon.org/weasyprint/stable/first_steps.html#alpine-3-12
# RUN apk add py3-pip py3-pillow py3-cffi py3-brotli gcc musl-dev python3-dev pango g++
RUN apk add py3-brotli gcc musl-dev python3-dev pango g++

RUN pip install mkdocs-with-pdf

WORKDIR /docs

CMD ["build"]

COPY ./set_lang.py /opt/set_lang.py
LABEL org.opencontainers.image.source=https://github.com/kfjt/mkdocsjp
LABEL org.opencontainers.image.url=https://github.com/kfjt/mkdocsjp
LABEL org.opencontainers.image.description="mkdocs jp"
LABEL org.opencontainers.image.licenses=MIT
LABEL org.opencontainers.image.title=mkdocs-material-jp

# VERSION=9.5.3 && docker build --build-arg VERSION=${VERSION} -t ghcr.io/kfjt/mkdocsjp:${VERSION} .