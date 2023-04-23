FROM python:3.12-rc-bullseye

ARG container_name
ENV CONTAINER_NAME $container_name

WORKDIR /$CONTAINER_NAME

RUN apk add gcc musl-dev python3-dev libffi-dev openssl-dev cargo


RUN pip install --upgrade pip

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

CMD [ "python3", "server.py"]

