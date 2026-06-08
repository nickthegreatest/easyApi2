"""Controller blueprints."""

from controllers.admin import admin_bp
from controllers.auth import auth_bp
from controllers.cart import cart_bp
from controllers.catalog import catalog_bp
from controllers.orders import orders_bp
from controllers.reviews import reviews_bp
from controllers.wishlist import wishlist_bp

__all__ = ["admin_bp", "auth_bp", "cart_bp", "catalog_bp", "orders_bp", "reviews_bp", "wishlist_bp"]
