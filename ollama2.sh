#!/bin/bash
MODEL_TO_RUN="llama3"

echo "Installing Ollama..."
curl -fsSL https://ollama.com/install.sh | sh

# Set OLLAMA_HOST environment variable
export OLLAMA_HOST=0.0.0.0
export OLLAMA_KEEP_ALIVE=24hr
echo "Installing model $MODEL_TO_RUN..."
ollama pull "$MODEL_TO_RUN"

# Start Ollama server in the background 
(ollama serve > ollama.log 2>&1) &

echo "Ollama service is running!"
echo "Running model $MODEL_TO_RUN..."
ollama run "$MODEL_TO_RUN"
