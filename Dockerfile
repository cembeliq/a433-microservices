# Use the official Node.js 14 image as the base image
FROM node:14

# Set the working directory in the container
WORKDIR /app

# Copy the rest of the application code
COPY . .

# Set environment variables
ENV NODE_ENV=production DB_HOST=item-db

# Install the dependencies in production mode
RUN npm install --production --unsafe-perm

# Build the application in production mode
RUN npm run build

# Expose the port the app runs on
EXPOSE 8080

# Command to run the application
CMD ["npm", "start"]
