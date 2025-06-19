
FROM rasa/rasa:3.6.16

ENV PATH="/opt/venv/bin:$PATH"
WORKDIR /app
COPY . /app

USER root
RUN pip install --no-cache-dir -r requirements.txt

# Train the model during build
RUN rasa train

USER rasa
ENTRYPOINT ["rasa", "run", "--enable-api", "--cors", "*", "--port", "8000"]
