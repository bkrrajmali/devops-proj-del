FROM nginx:latest
LABEL "ncpl.com"="Azure Project"
LABEL version="1.0"
LABEL description="Nginx Docker Image for Azure Project"
COPY index.html /usr/share/nginx/html/index.html
WORKDIR /app
ADD demo.txt .
ADD https://dlcdn.apache.org/maven/maven-3/3.9.11/binaries/apache-maven-3.9.11-bin.tar.gz .
ADD apache-tomcat-9.0.113.tar.gz .
RUN apt-get update && apt-get install -y wget
RUN pwd
RUN ls -la >> demo.txt
RUN echo "Hello, This is Nginx Docker Image for Azure Project" >> demo.txt
EXPOSE 80

