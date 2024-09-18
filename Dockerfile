# Use a small base image with Python
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Create a simple Python script that runs an HTTP server
RUN echo 'from http.server import BaseHTTPRequestHandler, HTTPServer\n\
class SimpleHandler(BaseHTTPRequestHandler):\n\
    def do_GET(self):\n\
        self.send_response(200)\n\
        self.send_header("Content-type", "text/html")\n\
        self.end_headers()\n\
        self.wfile.write(b"Hello World! 2")\n\
\n\
server = HTTPServer(("0.0.0.0", 8080), SimpleHandler)\n\
print("Starting server on port 8080...")\n\
server.serve_forever()\n' > server.py

# Expose port 8080
EXPOSE 8080

# Command to run the server
CMD ["python3", "server.py"]
