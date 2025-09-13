FROM python:3.10-slim

RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    git \
    libffi-dev \
    rustc \
    cargo \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /structure

# Copy files
COPY . .

# Upgrade pip etc.
RUN pip install --upgrade pip setuptools wheel

# Install Python dependencies
RUN pip install -r requirements.txt

# Expose port
EXPOSE 8020

# Run the app
CMD ["gunicorn", "app:app", "--bind", "0.0.0.0:8020", "--workers", "1"]