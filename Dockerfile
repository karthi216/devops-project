FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y fortune cowsay netcat && \
    apt-get clean

WORKDIR /app

COPY wisecow/wisecow.sh /app/wisecow.sh
RUN chmod +x /app/wisecow.sh

EXPOSE 4499
CMD ["./wisecow.sh"]