#!/bin/bash
echo "Benchmarking TPS..."

# Send test transactions
for i in {1..1000}; do
  curl -X POST http://localhost:8545 \
    -H "Content-Type: application/json" \
    -d '{"jsonrpc":"2.0","method":"eth_sendTransaction","params":[],"id":1}' &
done

wait
echo "Benchmark complete"
