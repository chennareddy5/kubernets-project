# Use the official CentOS Apache HTTP Server image
FROM centos/httpd

# Copy the local photogenic.zip file into the container
COPY photogenic.zip /var/www/html/

# Install unzip and extract the web content
RUN yum install -y unzip && \
    cd /var/www/html/ && \
    unzip photogenic.zip && \
    rm photogenic.zip

# Expose port 80 for HTTP
EXPOSE 80

# Start Apache HTTP Server
CMD ["httpd", "-D", "FOREGROUND"]
