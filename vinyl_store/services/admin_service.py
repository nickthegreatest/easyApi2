"""Business logic for admin dashboard."""

from __future__ import annotations

from repositories import catalog as catalog_repo
from repositories import users as users_repo


def dashboard() -> dict[str, object]:
    return {"sales": catalog_repo.sales_stats()}


def users() -> list[dict[str, object]]:
    return users_repo.list_users()
