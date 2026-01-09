FROM nginx:latest
LABEL "ncpl.com"="Demo Project"
LABEL version="1.0"
LABEL description="Nginx Docker Image for Demo Project"
COPY index.html /usr/shar/nginx/html/index.html
ADD demo.txt .