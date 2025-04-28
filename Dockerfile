FROM python:3.10-slim

WORKDIR /app

# Copy the entire project
COPY . .

# Install dependencies
RUN pip install grpcio

# Expose the port that greeter_server listens on
EXPOSE 8080

# Command to run the server
CMD ["python", "greeter_server.py"] 