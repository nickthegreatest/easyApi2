"""Business logic for wishlist operations."""

from __future__ import annotations

from middleware.errors import ValidationError
from repositories import catalog as catalog_repo
from repositories import wishlist as wishlist_repo


def add_to_wishlist(user_id: int, product_id: int):
    if not catalog_repo.get_product(product_id):
        raise ValidationError("Product not found")
    wishlist_repo.add(user_id, product_id)
    return wishlist_repo.list_items(user_id)


def list_wishlist(user_id: int):
    return wishlist_repo.list_items(user_id)


def remove_from_wishlist(user_id: int, product_id: int):
    return wishlist_repo.remove(user_id, product_id)
