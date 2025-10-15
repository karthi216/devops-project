FROM ubuntu:22.04

# Install required packages
RUN apt-get update && \
    apt-get install -y fortune cowsay netcat && \
    apt-get clean

# Set working directory
WORKDIR /app

# ✅ Correct path to wisecow.sh inside wisecow folder
COPY wisecow/wisecow.sh /app/wisecow.sh

# Make the script executable
RUN chmod +x /app/wisecow.sh

# Expose the port used by the server
EXPOSE 4499

# Run the shell-based web server
CMD ["./wisecow.sh"]