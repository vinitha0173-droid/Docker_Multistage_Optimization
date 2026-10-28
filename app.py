from http.server import BaseHTTPRequestHandler, HTTPServer
import json
import os


class AppHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        if self.path == "/health":
            response = {
                "status": "healthy",
                "service": "docker-web-app"
            }
            self.send_response(200)
            self.send_header("Content-Type", "application/json")
            self.end_headers()
            self.wfile.write(json.dumps(response).encode())
        else:
            self.send_response(200)
            self.send_header("Content-Type", "text/html; charset=utf-8")
            self.end_headers()
            self.wfile.write(
                b"<h1>Docker Web App</h1>"
                b"<p>Multi-stage container is running!</p>"
                b'<p><a href="/health">Check health</a></p>'
            )


if __name__ == "__main__":
    port = int(os.environ.get("PORT", "8000"))
    server = HTTPServer(("0.0.0.0", port), AppHandler)
    print(f"Server running on port {port}")
    server.serve_forever()
