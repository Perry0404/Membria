# Celestia DA Layer

Integration with Celestia for data availability.

## Setup

```bash
# Install Celestia light node
curl -sSL https://celestia.org/install.sh | bash

# Start light node
celestia light start --core.ip <rpc-url>
```

## Usage

The DA client submits state commitments to Celestia for availability.
