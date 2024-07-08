# Use the official Ubuntu image as the base image
FROM ubuntu:latest

# Update the package list and install Apache HTTP Server and unzip
RUN apt-get update && apt-get install -y apache2 unzip

# Set the working directory inside the container
WORKDIR /var/www/html

# Copy the local photogenic.zip file into the container
COPY photogenic.zip /var/www/html/

# Unzip the web content and remove the zip file
RUN unzip photogenic.zip && rm photogenic.zip

# Expose port 80 for HTTP
EXPOSE 80

# Start Apache HTTP Server
CMD ["apachectl", "-D", "FOREGROUND"]
