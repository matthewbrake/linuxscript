#!/bin/bash

# Install Ollama and model if not already installed
if ! command -v ollama &> /dev/null; then
  echo "Installing Ollama..."
  curl -fsSL https://ollama.com/install.sh | sh

  # Set OLLAMA_HOST environment variable
  export OLLAMA_HOST=0.0.0.0
fi

if ! ollama list | grep -q "$MODEL_TO_RUN"; then
  echo "Installing model $MODEL_TO_RUN..."
  ollama pull "$MODEL_TO_RUN"
fi

# Signal handler for graceful shutdown
shutdown_handler() {
  echo "Stopping Ollama server..."
  ollama stop
  exit 0
}

trap shutdown_handler SIGINT SIGTERM

# Start Ollama server in the background if not already running
if ! ps aux | grep "[o]llama serve" &> /dev/null; then
  (ollama serve > ollama.log 2>&1) &
fi

echo "Ollama service is running!"
echo "Running model $MODEL_TO_RUN..."
ollama run "$MODEL_TO_RUN"
