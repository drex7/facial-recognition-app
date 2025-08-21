FROM nginx:alpine

COPY client/ /usr/share/nginx/html/

COPY nginx-compose.conf /etc/nginx/nginx.conf

EXPOSE 80