FROM rasa/rasa:3.6.16

# Set environment path to avoid permission issues (use existing Rasa venv)
ENV PATH="/opt/venv/bin:$PATH"

# Set working directory inside the container
WORKDIR /app

# Copy project files
COPY . /app

# Install required Python packages inside Rasa’s existing venv
USER root
RUN pip install --no-cache-dir --upgrade pip \
 && pip install --no-cache-dir -r requirements.txt

# Train Rasa model during build (optional but slow)
RUN rasa train

# Set back to non-root user for safety
USER 1001

# Default command (you can override this in Render or docker-compose)
CMD ["rasa", "run", "--enable-api", "--cors", "*"]