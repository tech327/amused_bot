# Rasa image for core server
FROM rasa/rasa:3.6.16

# Set working directory
WORKDIR /app

# Copy all project files
COPY . /app

# Install dependencies if any
USER root
RUN pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt || true

# Expose Rasa port
EXPOSE 8000

# Start Rasa with API and CORS
CMD ["run", "--enable-api", "--cors", "*", "--port", "8000", "--model", "/app/models/20250617-115429-principal-channel.tar.gz"]