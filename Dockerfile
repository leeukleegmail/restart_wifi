FROM python:3.8

WORKDIR /$CONTAINER_NAME

COPY requirements.txt requirements.txt
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

CMD [ "python3", "server.py"]