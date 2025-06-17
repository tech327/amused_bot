FROM rasa/rasa:3.6.16

WORKDIR /app

COPY . /app

USER root

# Install Python dependencies if any
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Train model on container start
RUN rasa train

# Run Rasa server
CMD ["run", "--enable-api", "--cors", "*", "--port", "8000"]