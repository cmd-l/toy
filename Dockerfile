FROM python:3.10-slim

RUN apt-get update && apt-get install -y \
    build-essential \
    rustc \
    cargo \
    curl \
    git \
    libffi-dev \
    libssl-dev \
    libjpeg-dev \
    libxml2-dev \
    libxslt1-dev \
    zlib1g-dev \
    libblas-dev \
    liblapack-dev \
    pkg-config \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /structure

COPY . .

RUN pip install --upgrade pip setuptools wheel

RUN pip install -r requirements.txt

EXPOSE 8020

CMD ["gunicorn", "structure:app", "--bind", "0.0.0.0:8020", "--workers", "1"]
