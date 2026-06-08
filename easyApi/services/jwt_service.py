"""Сервис JWT: генерация и проверка токенов."""

from __future__ import annotations

import logging
from datetime import datetime, timedelta, timezone
from typing import Any

import jwt
from jwt.exceptions import ExpiredSignatureError, InvalidTokenError

from easyApi.config import get_config
from easyApi.db.exceptions import TokenExpiredError, TokenInvalidError

logger = logging.getLogger(__name__)


def generate_token(user_data: dict[str, Any]) -> str:
    """Генерирует JWT-токен для пользователя.

    Args:
        user_data: Словарь с ключами id, username, role.

    Returns:
        Закодированная JWT-строка.
    """
    cfg = get_config()
    payload = {
        "sub": str(user_data["id"]),
        "username": user_data["username"],
        "role": user_data["role"],
        "exp": datetime.now(timezone.utc) + timedelta(hours=cfg.JWT_EXPIRATION_HOURS),
    }
    return jwt.encode(payload, cfg.SECRET_KEY, algorithm="HS256")


def verify_token(token: str) -> dict[str, Any]:
    """Декодирует и проверяет JWT-токен.

    Args:
        token: JWT-строка из заголовка запроса.

    Returns:
        Словарь с id, username, role.

    Raises:
        TokenExpiredError: Если срок действия токена истёк.
        TokenInvalidError: Если токен недействителен.
    """
    cfg = get_config()
    # Allow numeric `sub` by skipping PyJWT subject-type validation
    try:
        payload = jwt.decode(
            token,
            cfg.SECRET_KEY,
            algorithms=["HS256"],
            options={"verify_sub": False},
        )
    except ExpiredSignatureError as exc:
        raise TokenExpiredError() from exc
    except InvalidTokenError as exc:
        raise TokenInvalidError() from exc

    sub = payload.get("sub")
    try:
        user_id = int(sub)
    except Exception:
        raise TokenInvalidError()

    return {
        "id": user_id,
        "username": payload.get("username"),
        "role": payload.get("role"),
    }

