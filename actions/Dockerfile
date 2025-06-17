# Rasa SDK for custom actions
FROM rasa/rasa-sdk:3.6.1

# Set working directory
WORKDIR /app/actions

# Copy action code into the image
COPY . /app/actions

# Install any extra dependencies (optional)
USER root
RUN pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt || true

# Expose port used by action server
EXPOSE 5055

# Run the action server
CMD ["start", "--actions", "actions"]