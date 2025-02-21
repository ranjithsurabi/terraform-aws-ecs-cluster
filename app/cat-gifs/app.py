from flask import Flask, send_file
import os

app = Flask(__name__)

@app.route("/")
def serve_gif():
    return send_file("smiley.gif", mimetype="image/gif")

if __name__ == "__main__":
    port = int(os.environ.get("PORT", 5000))
    app.run(host="0.0.0.0", port=port)