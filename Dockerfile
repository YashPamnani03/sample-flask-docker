FROM ubuntu:jammy

RUN apt-get update && \
    apt-get install -y python3 python3-setuptools python3-dev build-essential python3-pip python3-mysqldb python3-venv python3-requests

WORKDIR /opt/webapp

COPY . /opt/webapp/

RUN python3 -m venv .venv && \
    . .venv/bin/activate && \
    pip install -r requirements.txt

ENV FLASK_APP=/opt/webapp/app.py

EXPOSE 5000

CMD ["/opt/webapp/.venv/bin/flask", "run", "--host=0.0.0.0"]
