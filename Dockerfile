# Use the official Bun image
FROM oven/bun:latest
WORKDIR /app

# Copy package manifest and install production dependencies
COPY package.json bun.lock* ./
RUN bun install --production

# Copy app source code
COPY src/ ./src
COPY tsconfig.json ./

# Set environment and expose port 5111
ENV NODE_ENV=production
EXPOSE 4420

# Start the server (adjust to your entry point)
CMD ["bun", "src/index.ts"]