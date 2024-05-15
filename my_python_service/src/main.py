import json
from typing import Any


def handler(event: dict[str, Any], context: dict[str, Any]) -> dict[str, Any]:
    return {"statusCode": 200, "body": json.dumps("Hello, World! I am python.")}
