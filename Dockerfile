FROM python:3.9-slim as backend

WORKDIR /app/server

COPY server/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY server/ .

EXPOSE 5000

CMD ["python", "app.py"]


FROM nginx:alpine as frontend

COPY client/ /usr/share/nginx/html/

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80


FROM python:3.9-slim as production

RUN apt-get update && apt-get install -y \
    nginx \
    libpq-dev \
    gcc \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY server/requirements_clean.txt ./server/
RUN pip install --no-cache-dir -r server/requirements_clean.txt

COPY server/ ./server/
COPY client/ /var/www/html/

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

CMD ["sh", "-c", "nginx && cd server && python app.py"]