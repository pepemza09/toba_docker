ARG PHP_VERSION=8.2

# Use Debian Slim as the base image
FROM debian:bookworm-slim

# Update the package list
RUN apt update && apt upgrade -y && apt autoremove -y

# Install required packages
RUN apt install apache2 composer libapache2-mod-php${PHP_VERSION} npm git -y

# Install Yarn
RUN npm install --global yarn

# Install PHP extensions
RUN apt install -y \
    php${PHP_VERSION}-cli \
    php${PHP_VERSION}-curl \    
    php${PHP_VERSION}-gd \
    php${PHP_VERSION}-mbstring \
    php${PHP_VERSION}-pdo \
    php${PHP_VERSION}-pdo_pgsql \
    php${PHP_VERSION}-xml \
    php${PHP_VERSION}-zip \
    && apt clear

# Set the working directory
WORKDIR /var/www

# Copy the project files into the container
COPY ./toba /var/www/toba

# Expose port 80 for Apache
EXPOSE 80

# Start Apache in the foreground
CMD ["apachectl", "-D", "FOREGROUND"]