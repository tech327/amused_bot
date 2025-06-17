#!/bin/bash

# Start the action server in background
rasa run actions --port 5055 &

# Start rasa server
rasa run --enable-api --cors "*" --port 8000