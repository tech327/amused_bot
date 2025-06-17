#!/bin/bash

# Train if no model found
if [ ! -f "models/*.tar.gz" ]; then
  echo "Training model..."
  rasa train
fi

# Start action server
rasa run actions --port 5055 &

# Start rasa server
rasa run --enable-api --cors "*" --port 8000