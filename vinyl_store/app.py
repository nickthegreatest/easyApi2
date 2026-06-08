"""Vintage Vinyl Store application using the custom EasyApi library."""

from __future__ import annotations

import logging
from pathlib import Path

from dotenv import load_dotenv

# Load environment variables from .env file BEFORE importing config
BASE_DIR = Path(__file__).resolve().parent
load_dotenv(BASE_DIR / ".env")

from flask import send_from_directory

from easyApi import EasyApi
from config import AppConfig, easyapi_settings
from middleware import register_error_handlers, register_request_logging
from routes import register_routes

PROJECT_ROOT = BASE_DIR.parent

logging.basicConfig(level=logging.INFO, format="%(asctime)s %(levelname)s %(name)s: %(message)s")

config = AppConfig()
kit = EasyApi(config=easyapi_settings(config), name="vintage_vinyl_store")
app = kit.flask
app.static_folder = str(BASE_DIR / "static")
app.config["UPLOAD_FOLDER"] = str(PROJECT_ROOT / config.upload_folder)

register_error_handlers(app)
register_request_logging(app)
register_routes(app)


@app.get("/")
def index():
    """Serve the main storefront page."""

    return send_from_directory(BASE_DIR / "templates", "index.html")


@app.get("/health")
def health():
    """Small health endpoint for local checks."""

    return {"success": True, "message": "Vintage Vinyl Store API is running"}


@app.get("/<path:path>")
def spa(path: str):
    """Serve static files or fall back to the SPA template for page routes."""

    if path.startswith("static/"):
        return send_from_directory(BASE_DIR, path)
    if path.startswith("uploads/"):
        return send_from_directory(PROJECT_ROOT, path)
    return send_from_directory(BASE_DIR / "templates", "index.html")


if __name__ == "__main__":
    kit.run(host="0.0.0.0", port=5000, debug=True)
