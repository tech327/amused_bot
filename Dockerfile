# Use the official Rasa image
FROM rasa/rasa:3.6.16

# Set working directory
WORKDIR /app

# Copy all project files into the container
COPY . /app

# Install extra dependencies if needed (comment out if not required)
# USER root
# RUN pip install -r requirements.txt

# Train the Rasa model
RUN rasa train

# Expose port for Render or other services
EXPOSE 8000

# Run Rasa server and include actions from actions.py inside container
CMD ["rasa", "run", "--enable-api", "--cors", "*", "--port", "8000", "--actions", "actions"]