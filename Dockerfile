FROM python:3.9.4-slim

ENV PYTHONUNBUFFERED 1

WORKDIR /app

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    file        \
    gcc         \
    libwww-perl && \
    apt-get autoremove -y && \
    apt-get clean

RUN pip install --upgrade pip

RUN pip install poetry
COPY ./pyproject.toml /pyproject.toml
RUN poetry config virtualenvs.create false
RUN poetry install

COPY . .
