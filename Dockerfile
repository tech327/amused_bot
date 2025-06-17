FROM rasa/rasa:3.6.16

USER root

WORKDIR /app

# Copy everything
COPY . /app

# Install Python dependencies if needed


# Make sure script is executable
RUN chmod +x start.sh

# Start both rasa server and action server
CMD ["./start.sh"]