FROM python:3.10.11-alpine

RUN apk add gcc \
    musl-dev \
    python3-dev \
    libffi-dev \
    openssl-dev \
    cargo \
    make

ARG container_name
ENV CONTAINER_NAME $container_name

WORKDIR /$CONTAINER_NAME

RUN pip install --upgrade pip

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

CMD [ "python", "server.py"]