#!/bin/bash
# Wait for a specific environment variable to be set
while [ -z "$MODEL" ]; do
  echo "Waiting for MODEL environment variable..."
  sleep 1
done

echo "Using model: $MODEL"

#MODEL="llama3"

echo "Installing Ollama..."
curl -fsSL https://ollama.com/install.sh | sh

# Export OLLAMA_HOST before starting the server
export OLLAMA_HOST=0.0.0.0

echo "Starting Ollama server..."
# Start Ollama server in the background
ollama serve > /ollama.log 2>&1 &

# Wait for the server to be ready
echo "Waiting for Ollama server to start..."
while ! curl -s http://127.0.0.1:11434 > /dev/null; do
  sleep 1
done

echo "Ollama server is up!"

echo "Installing model $MODEL..."
ollama pull "$MODEL"

echo "Ollama service is running!"
echo "To interact with the model, use the 'ollama' command."

# Keep the container running by tailing the log
tail -f /ollama.log
