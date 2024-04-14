FROM python:3.11-slim-bookworm

RUN apt-get update \
    && apt-get install --no-upgrade --no-install-recommends -y curl \
    && apt-get clean -y \
    && apt-get autoclean -y \
    && rm -rf /var/lib/apt/lists/*

ENV POETRY_HOME="/opt/poetry" \
    POETRY_VIRTUALENVS_IN_PROJECT=false \
    POETRY_VIRTUALENVS_CREATE=false \
    POETRY_NO_INTERACTION=1 \
    POETRY_VERSION=1.8.2

RUN curl -sSL https://install.python-poetry.org | python3 -
ENV PATH="$PATH:$POETRY_HOME/bin"

WORKDIR /app
COPY . ./

EXPOSE 8000
ENTRYPOINT ["./entrypoint.sh"]
RUN poetry install

