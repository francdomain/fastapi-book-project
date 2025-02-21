#!/bin/bash

# Check if Docker is installed
if ! command -v docker &> /dev/null; then
    echo "🚀 Docker not found! Installing Docker..."

    # Update package lists
    sudo apt-get update
    sudo apt-get upgrade -y

    # Install Docker
    sudo apt-get install -y docker.io \
        curl \
        docker-compose

    # Start and enable Docker service
    sudo systemctl start docker
    sudo systemctl enable docker

    # Add 'ubuntu' user to Docker group (avoid needing sudo)
    sudo usermod -aG docker ubuntu

    echo "✅ Docker installation complete."
else
    echo "✅ Docker is already installed."
fi

# Restart Docker service (ensure it runs)
echo "🔄 Restarting Docker service..."
sudo systemctl restart docker
echo "✅ Docker service restarted successfully."