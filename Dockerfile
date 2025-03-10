# Use official Python runtime as a parent image
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    pkg-config \
    clang \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
RUN pip install --no-cache-dir crawl4ai[all] uvicorn

# Copy the entrypoint script
COPY entrypoint.sh .

# Make the entrypoint executable
RUN chmod +x entrypoint.sh

# Expose the port Crawl4AI uses
EXPOSE 11235

# Run the application
CMD ["./entrypoint.sh"]
