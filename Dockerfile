# Use Node.js base image
FROM node:18-alpine

# Set working directory
WORKDIR /app
FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y fortune cowsay netcat && \
    apt-get clean

COPY wisecow.sh /app/wisecow.sh
WORKDIR /app
RUN chmod +x wisecow.sh

EXPOSE 4499
CMD ["./wisecow.sh"]