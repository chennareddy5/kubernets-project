# Use a base image with support for copying and extracting content
FROM centos

# Set the working directory inside the container
WORKDIR /var/www/html

# Copy the local photogenic.zip file into the container
COPY photogenic.zip /var/www/html/

# Install unzip (if not already installed) and extract the web content
RUN yum install -y unzip && unzip photogenic.zip && rm photogenic.zip

# Expose port 80 for HTTP
EXPOSE 80

# Start Apache HTTP Server
CMD ["httpd", "-D", "FOREGROUND"]
