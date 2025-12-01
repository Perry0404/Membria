#!/bin/bash
echo \"Deploying contracts...\"
cd contracts
forge build
forge script script/Deploy.s.sol --broadcast
