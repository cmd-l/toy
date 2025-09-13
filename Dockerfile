FROM python:3.10-slim

RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    git \
    libffi-dev \
    rustc \
    cargo \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . .

RUN pip install --upgrade pip setuptools wheel

RUN pip install -r requirements.txt

EXPOSE 8020

CMD ["gunicorn", "structure:server", "--bind", "0.0.0.0:8020", "--workers", "1"]
