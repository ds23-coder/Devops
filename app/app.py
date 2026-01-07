from flask import Flask, request, jsonify
import logging
import uuid
from datetime import datetime

app = Flask(__name__)

logger = logging.getLogger("devops-feedback")
logger.setLevel(logging.INFO)
handler = logging.StreamHandler()
formatter = logging.Formatter('%(message)s')
handler.setFormatter(formatter)
logger.addHandler(handler)

def log_event(event: str, **fields):
    payload = {
        "timestamp": datetime.utcnow().isoformat() + "Z",
        "event": event,
        **fields
    }
    logger.info(payload)

@app.get("/")
def home():
    return """
    <h1>DevOps Feedback App</h1>
    <form method="post" action="/api/feedback">
        <input name="message" placeholder="Enter feedback" required />
        <button type="submit">Submit</button>
    </form>
    <p><a href="/health">Health check</a></p>
    """

@app.get("/health")
def health():
    return jsonify({"status": "ok"}), 200

@app.post("/api/feedback")
def feedback():
    trace_id = str(uuid.uuid4())
    message = request.form.get("message")
    if message is None and request.is_json:
        message = (request.json or {}).get("message")

    log_event(
        "feedback_received",
        trace_id=trace_id,
        route="/api/feedback",
        message=message
    )

    return jsonify({"status": "received", "trace_id": trace_id}), 201

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)
