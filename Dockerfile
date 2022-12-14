FROM python:3.7-alpine

ARG container_name
ENV CONTAINER_NAME $container_name
WORKDIR /$CONTAINER_NAME

RUN apk add --update \
    gcc \
    py-cffi \
    rust \
    libffi-dev \
    cargo \
    openssl-dev \
    make

RUN /usr/local/bin/python -m pip install --upgrade pip

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

RUN pip install cryptography

CMD [ "python3", "server.py"]
