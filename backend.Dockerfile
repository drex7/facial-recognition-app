FROM python:3.9-slim

RUN apt-get update && apt-get install -y \
    curl \
    libpq-dev \
    gcc \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app


COPY server/requirements_clean.txt .
RUN pip install --no-cache-dir -r requirements_clean.txt

COPY server/ .

EXPOSE 5000

CMD ["python", "app.py"]