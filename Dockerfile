FROM python:3.10
ENV PYTHONUNBUFFERED 1

RUN mkdir /code
WORKDIR /code

RUN set -x && \
    apt-get -y update && apt-get install -y \
    sudo \
    wget \
    vim \
    && apt-get update \
    && apt-get install -y tzdata

RUN pip install argon2-cffi \
    && pip install --upgrade pip \
    && pip install django==4 \
    && pip install django-shortcuts \
    && pip install Pillow \
    && pip install psycopg2-binary \
    && pip install requests \
    && pip install django-environ \
    && pip install djangorestframework \
    && pip install django-extensions

EXPOSE 8000

# ADD . /code/
# COPY requirements.txt /code
# RUN pip install -r requirements.txt