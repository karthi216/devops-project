FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    cowsay \
    fortune \
    netcat \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY wisecow/wisecow.sh /app/wisecow.sh
RUN chmod +x /app/wisecow.sh

EXPOSE 4499
CMD ["/app/wisecow.sh"]





