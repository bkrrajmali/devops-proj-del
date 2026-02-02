FROM nginx:latest
LABEL "ncpl.com"="Demo Project"
LABEL version="1.0"
LABEL description="Nginx Docker Image for Demo Project"
COPY index.html /usr/share/nginx/html/index.html
WORKDIR /app
ADD demo.txt .
RUN ls -l > output.txt
ADD https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.50/bin/apache-tomcat-10.1.50.tar.gz .
RUN ls -l >> output.txt
RUN apt update && apt install figlet -y
EXPOSE 80
CMD pwd
CMD echo "THIS IS CMD"
ENTRYPOINT pwd