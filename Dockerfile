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
    cargo \
    openssl-dev \
    make


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


RUN /usr/local/bin/python -m pip install --upgrade pip

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

RUN pip install cryptography


CMD [ "python3", "server.py"]
