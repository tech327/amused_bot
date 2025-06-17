FROM rasa/rasa:3.6.16

USER root

WORKDIR /app

COPY . /app

# Install dependencies if needed
#RUN pip install --no-cache-dir -r requirements.txt

# Make the script executable
RUN chmod +x start.sh

# 🔥 THIS IS THE FIX: override the entrypoint
ENTRYPOINT ["/bin/bash", "./start.sh"]