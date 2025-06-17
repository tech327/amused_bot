FROM rasa/rasa:3.6.16

# Set environment path to use Rasa's venv and avoid permission issues
ENV PATH="/opt/venv/bin:$PATH"

# Set working directory
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

# (Optional) Silence SQLAlchemy 2.x deprecation warnings
ENV SQLALCHEMY_WARN_20=0 \
    SQLALCHEMY_SILENCE_UBER_WARNING=1

# ✅ Create entrypoint script using printf to avoid Windows line endings
RUN printf '#!/bin/bash\nexec rasa run --enable-api --cors "*" --port ${PORT:-8000}\n' > /app/entrypoint.sh && \
    chmod +x /app/entrypoint.sh

# Revert to non-root user
USER 1001

# Expose port for Render
EXPOSE 8000

# ✅ Use ENTRYPOINT instead of CMD to prevent Render CLI override issue
ENTRYPOINT ["/app/entrypoint.sh"]
