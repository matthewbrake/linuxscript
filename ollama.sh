#!/bin/bash
# Ollama Script

# Install dependencies
apt-get update && apt-get install -y curl wget git build-essential

# Install Ollama (non-interactive)
curl -fsSL https://ollama.com/install.sh | sh

# Skip Lambda Stack (not always necessary for PyTorch CUDA images)
# If you need it, manually install GPU drivers before running this script

# Update system packages
apt-get update && apt-get upgrade -y

# Set OLLAMA_HOST environment variable
export OLLAMA_HOST=0.0.0.0

# Start Ollama server in the background
(ollama serve > ollama.log 2>&1) &

# Ensure the Ollama service starts, retrying if necessary
until curl -s http://localhost:11434 | grep -q "Ollama"; do
    echo "Ollama service not yet active. Waiting 5 seconds..."
    sleep 5
done

echo "Ollama service is running!"

# Specify the model to run (replace 'your_model_name' with the actual model)
MODEL_TO_RUN="mistral" 
ollama run "$MODEL_TO_RUN"
