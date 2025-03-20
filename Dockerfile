# Use Debian Slim as the base image
FROM debian:bullseye-slim

# Update the package list
RUN apt update && apt upgrade -y && apt autoremove -y

