# Use an official Node.js runtime as the base image
FROM node:16

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json (if exists) to the container
COPY package*.json ./

# Install dependencies inside the container with verbose output for debugging
RUN npm install --verbose

# Copy the rest of the application code
COPY . .

# Expose the port that the application will run on
EXPOSE 8080

# Define the command to run the application
CMD ["node", "server.js"]
