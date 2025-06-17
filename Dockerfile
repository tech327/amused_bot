FROM rasa/rasa:3.6.16

# Set environment path to use Rasa's venv and avoid permission issues
ENV PATH="/opt/venv/bin:$PATH"

# Use working directory
WORKDIR /app

# Copy all project files
COPY . /app

# Switch to root to install Python dependencies
USER root

# Upgrade pip and install dependencies
RUN pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt

# Train the Rasa model
RUN rasa train

# (Optional) Add this to silence SQLAlchemy 2.x deprecation warnings
ENV SQLALCHEMY_WARN_20=0 \
    SQLALCHEMY_SILENCE_UBER_WARNING=1

# Create entrypoint script for dynamic port binding
RUN echo '#!/bin/bash\nexec rasa run --enable-api --cors "*" --port ${PORT:-8000}' > /app/entrypoint.sh \
    && chmod +x /app/entrypoint.sh

# Revert to non-root user for running the app
USER 1001

# Expose port for Render
EXPOSE 8000

# Start the Rasa server using entrypoint script
CMD ["/app/entrypoint.sh"]