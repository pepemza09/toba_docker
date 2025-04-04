ARG PHP_VERSION=8.2

# Use Debian Slim as the base image
FROM debian:bookworm-slim

# Update the package list
RUN apt update && apt upgrade -y && apt autoremove -y

# Install required packages
RUN apt install apache2 composer libapache2-mod-php8.2 npm git -y

# Install Yarn
RUN npm install --global yarn

# Install PHP extensions
RUN apt install -y \
    php8.2-cli \
    php8.2-curl \    
    php8.2-gd \
    php8.2-mbstring \
    php8.2-pdo \
    php8.2-pgsql \
    php8.2-xml \
    php8.2-zip 

# Set the working directory
WORKDIR /var/www

# Copy the project files into the container
COPY ./toba /var/www/toba

# Expose port 80 for Apache
EXPOSE 80

# Start Apache in the foreground
CMD ["apachectl", "-D", "FOREGROUND"]