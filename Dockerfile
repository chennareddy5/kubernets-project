FROM ubuntu:latest

# Install Apache and unzip
RUN apt-get update && apt-get install -y apache2 unzip

# Set the working directory
WORKDIR /var/www/html

# Copy the photogenic directory into the container
COPY photogenic /var/www/html/photogenic

# Expose port 80
EXPOSE 80

# Start Apache server in the foreground
CMD ["apachectl", "-D", "FOREGROUND"]
