#!/bin/bash
MODEL_TO_RUN="llama3"

echo "Installing Ollama..."
curl -fsSL https://ollama.com/install.sh | sh

# Set OLLAMA_HOST environment variable
export OLLAMA_HOST=0.0.0.0

echo "Installing model $MODEL_TO_RUN..."
ollama pull "$MODEL_TO_RUN"

# Start Ollama server in the background 
(ollama serve > ollama.log 2>&1) &

# Ensure the Ollama service starts, retrying if necessary
until curl -s http://localhost:11434 | grep -q "Ollama"; do
  echo "Ollama service not yet active. Waiting 5 seconds..."
  sleep 5
done

echo "Ollama service is running!"
echo "To interact with the model, use the 'ollama' command."
