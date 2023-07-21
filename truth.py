from truthbrush.api import Api
import json
import os
from dotenv import load_dotenv


load_dotenv()  # take environment variables from .env.
api = Api(
    os.getenv("TRUTHSOCIAL_USERNAME"),
    os.getenv("TRUTHSOCIAL_PASSWORD"),
    os.getenv("TRUTHSOCIAL_TOKEN"),
)


def truth():
    """Compose Truth."""

    print(json.dumps(api.compose_truth()))


if __name__ == '__main__' :
    truth()
