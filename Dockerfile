FROM python:3.10-slim

WORKDIR /app
COPY . .


#RUN apt-get update && apt-get upgrade -y
#RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/install-poetry.py | python -
#ENV PATH /root/.poetry/bin:$PATH

RUN pip install --upgrade pip && pip install poetry
RUN poetry config virtualenvs.in-project true
RUN poetry run pip install -U setuptools==57.0.0
RUN poetry export --without-hashes -f requirements.txt > requirements.txt
RUN pip install -r requirements.txt


#ENV POETRY_VENV=/opt/poetry-venv
#
#RUN python3 -m venv $POETRY_VENV \
#    && $POETRY_VENV/bin/pip install -U pip setuptools \
#    && $POETRY_VENV/bin/pip install poetry
#
## Add `poetry` to PATH
#ENV PATH="${PATH}:${POETRY_VENV}/bin"
#RUN poetry config virtualenvs.in-project true
RUN poetry install
