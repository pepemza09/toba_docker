# Use Debian Slim as the base image
FROM debian:bookworm-slim

# Update the package list
RUN apt update && apt upgrade -y && apt autoremove -y

# Install required packages
RUN apt install apache2 composer libapache2-mod-php8.2 npm git -y

# Install Yarn
RUN npm install --global yarn

