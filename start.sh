#!/bin/bash



# Start action server
rasa run actions --port 5055 &

# Start rasa server
rasa run  20250617-115429-principal-channel.tar.gz --enable-api --cors "*" --port 8000
