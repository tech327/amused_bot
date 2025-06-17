FROM rasa/rasa:3.6.16

# Set working directory
WORKDIR /app

# Copy all project files
COPY . /app

# (Optional) Install any dependencies for actions.py
RUN pip install --no-cache-dir -r requirements.txt

# Train the model
RUN rasa train

# Expose Rasa HTTP API port
EXPOSE 8000

# Start Rasa server with actions in the same container
CMD ["rasa", "run", "--enable-api", "--cors", "*", "--port", "8000", "--actions", "actions"]
