// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract FinalityOracle {
    struct FinalityCheckpoint {
        uint256 blockNumber;
        bytes32 blockHash;
        uint256 timestamp;
        bool verified;
    }

    mapping(uint256 => FinalityCheckpoint) public checkpoints;
    address public validator;

    constructor(address _validator) {
        validator = _validator;
    }

    function submitCheckpoint(uint256 blockNumber, bytes32 blockHash) external {
        require(msg.sender == validator, "Only validator");
        checkpoints[blockNumber] = FinalityCheckpoint({
            blockNumber: blockNumber,
            blockHash: blockHash,
            timestamp: block.timestamp,
            verified: true
        });
    }

    function isFinalized(uint256 blockNumber) external view returns (bool) {
        return checkpoints[blockNumber].verified;
    }
}
