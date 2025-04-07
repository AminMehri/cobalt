# Base image
FROM node:20-alpine

# Set working directory inside the container
WORKDIR /app

# Install pnpm globally
RUN npm install -g pnpm

# Copy only package files first for caching
COPY api/src/pnpm-lock.yaml api/src/package.json ./

# Install dependencies
RUN pnpm install

# Copy the rest of the source code
COPY api/src .

# Add a default API_URL for local dev, can be overridden by Docker env
ENV API_URL=http://localhost:9000/

# Expose the port if needed (adjust if needed)
EXPOSE 9000

# Start the app
CMD ["pnpm", "start"]
