# Use Node 18 Alpine as base
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy dependency files
COPY package*.json tsconfig*.json ./

# Install dependencies
RUN npm install

# Copy application code
COPY . .

# Set environment to development
ENV NODE_ENV=development

# Configure Vite dev server to accept outside connections
ENV VITE_HOST=0.0.0.0
ENV VITE_PORT=5173

# Expose Vite's default port
EXPOSE 5173

# Start development server
CMD ["npm", "run", "dev", "--", "--host", "0.0.0.0"]
