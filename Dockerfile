FROM python:3.10-slim

WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Copy the entire project
COPY . .

# Install the package in editable mode
RUN pip install --no-cache-dir -e .

# Create logs directory
RUN mkdir -p /app/logs && chmod 777 /app/logs

# Expose the gRPC port
EXPOSE 50051

# Command to run the server
CMD ["python", "lerobot/scripts/server/policy_server.py"]
