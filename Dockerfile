FROM rasa/rasa:3.6.16

WORKDIR /app

# Copy your project files
COPY . /app

# If you don't need custom dependencies, skip pip install
# RUN pip install --no-cache-dir -r requirements.txt

# Train the model
RUN rasa train

# Expose port for Render or local testing
EXPOSE 8000

# Run both Rasa server and custom actions
CMD ["rasa", "run", "--enable-api", "--cors", "*", "--port", "8000", "--actions", "actions"]