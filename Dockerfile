FROM rasa/rasa:3.6.16

# Copy all project files
COPY . /app
WORKDIR /app

# Install dependencies (if any)
RUN pip install -r requirements.txt

# Train model at build time
RUN rasa train