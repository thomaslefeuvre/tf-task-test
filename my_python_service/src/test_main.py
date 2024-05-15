import json
from typing import Any
from main import handler


def test_lambda_handler():
    event: dict[str, Any] = {}
    context: dict[str, Any] = {}
    response = handler(event, context)
    assert response["statusCode"] == 200
    assert json.loads(response["body"]) == "Hello, World! I am python."
