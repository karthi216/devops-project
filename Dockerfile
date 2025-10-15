# Use Ubuntu base image
FROM ubuntu:22.04

# Install required packages
RUN apt-get update && \
    apt-get install -y fortune cowsay netcat && \
    apt-get clean

# Create working directory
WORKDIR /app

# Copy the shell script from wisecow folder
COPY wisecow/wisecow.sh /app/wisecow.sh

# Make the script executable
RUN chmod +x /app/wisecow.sh

# Expose the server port
EXPOSE 4499

# Run the shell-based web server
CMD ["./wisecow.sh"]