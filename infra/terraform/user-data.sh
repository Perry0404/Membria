#!/bin/bash
set -e

# Install Docker
apt-get update
apt-get install -y docker.io docker-compose

# Clone repository
git clone https://github.com/Perry0404/Membria.git /opt/dual-layer-evm
cd /opt/dual-layer-evm

# Start services
docker-compose -f infra/docker-compose.yml up -d
