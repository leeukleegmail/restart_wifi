FROM python:3

ARG container_name
ENV CONTAINER_NAME $container_name

WORKDIR /$CONTAINER_NAME

COPY rustup-init.sh rustup-init.sh
RUN rustup-init.sh

RUN pip install --upgrade pip

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

CMD [ "python3", "server.py"]

