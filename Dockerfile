FROM rasa/rasa:3.6.16

WORKDIR /app

# Copy all files into the container
COPY . /app

# Make config.yml writable to avoid PermissionError during auto-config
RUN chmod +w config.yml

# (Optional) Install Python dependencies if you have a requirements.txt
# RUN pip install --no-cache-dir -r requirements.txt

# Train the Rasa model
RUN rasa train

# Expose port for API access
EXPOSE 8000

# Run Rasa server and actions in one container
CMD ["rasa", "run", "--enable-api", "--cors", "*", "--port", "8000", "--actions", "actions"]
