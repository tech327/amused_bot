FROM rasa/rasa:3.6.16

# Set environment path to use Rasa’s venv and avoid permission issues
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

# Revert to non-root user for running the app
USER 1001

# Expose port for Render (optional but good practice)
EXPOSE 8000

# Start the Rasa server with API enabled and CORS open for all
CMD ["rasa", "run", "--enable-api", "--cors", "*", "--port", "8000"]
