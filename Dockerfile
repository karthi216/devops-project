FROM node:18-alpine

WORKDIR /app
COPY wisecow/package*.json ./
RUN npm install
COPY wisecow/. .
EXPOSE 3000
CMD ["npm", "start"]