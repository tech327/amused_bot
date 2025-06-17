FROM rasa/rasa:3.6.16

WORKDIR /app

# Copy all project files
COPY . /app

# (Optional) Install Python dependencies
# RUN pip install --no-cache-dir -r requirements.txt

# Expose port for API access
EXPOSE 8000

# Run Rasa server and actions together
CMD ["rasa", "run", "--enable-api", "--cors", "*", "--port", "8000", "--actions", "actions"]