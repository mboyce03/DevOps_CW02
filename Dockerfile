# Use Node.js 16 as the base image
FROM node:16

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json (if exists) to the container
# Make sure your code includes a valid package.json file
COPY package*.json ./

# Install dependencies inside the container
RUN npm install --verbose

# Copy the rest of the application code (server.js, etc. )
COPY . .

# Expose the port that the application will run on
EXPOSE 8080

# Define the command to run the application
CMD ["node", "server.js"]
