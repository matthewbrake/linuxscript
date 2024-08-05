#!/bin/bash

MODEL_TO_RUN="llama3"

echo "Installing Ollama..."
curl -fsSL https://ollama.com/install.sh | sh

# Export OLLAMA_HOST before starting the server
export OLLAMA_HOST=0.0.0.0

echo "Installing model $MODEL_TO_RUN..."
ollama pull "$MODEL_TO_RUN"

echo "Starting Ollama server..."
# Run Ollama server in the background and ensure it stays up
ollama serve > /ollama.log 2>&1 &

# Wait for the server to start before continuing
sleep 10

echo "Ollama service is running!"
echo "To interact with the model, use the 'ollama' command."

# Keep the container running by tailing the log
tail -f /ollama.log
