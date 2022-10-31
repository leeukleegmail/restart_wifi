FROM python:3.7-alpine

ARG container_name
ENV CONTAINER_NAME $container_name
WORKDIR /$CONTAINER_NAME

ENV PYTHONUNBUFFERED 1
#
RUN apk add --update \
    gcc \
    py-cffi \
    rust \
    libffi-dev \
    cargo

#      build-base \
#      cairo \
#      cairo-dev \
#      cargo \
#      freetype-dev \
#      gdk-pixbuf-dev \
#      gettext \
#      jpeg-dev \
#      lcms2-dev \
#      musl-dev \
#      openjpeg-dev \
#      openssl-dev \
#      pango-dev \
#      poppler-utils \
#      postgresql-client \
#      postgresql-dev \
#      py-cffi \
#      python3-dev \
#      tcl-dev \
#      tiff-dev \
#      tk-dev \
#      zlib-dev

RUN pip install cryptography

RUN pip install --upgrade pip

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

CMD [ "python3", "server.py"]
