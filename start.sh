#!/bin/bash



# Start action server
rasa run actions --port 5055 &

# Start rasa serverrasa run --enable-api --cors "*" --model models/20250617-115429-principal-channel.tar.gz --port 8000
