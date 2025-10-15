# Use Node.js base image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json from wisecow folder
COPY wisecow/package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY wisecow/. .

# Expose the app port
EXPOSE 3000

# Start the app
CMD ["npm", "start"]