FROM rasa/rasa-sdk:3.6.1

WORKDIR /app

COPY . /app

USER root

# Install extra dependencies for MySQL + OpenAI
RUN pip install --no-cache-dir mysql-connector-python python-dotenv openai dateparser

CMD ["python", "-m", "rasa_sdk", "--port", "5055"]
