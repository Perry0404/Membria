// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {IColdState} from "../interfaces/IColdState.sol";

contract ColdStorage is IColdState {
    struct StateCommitment {
        bytes32 stateRoot;
        bytes32 hotStateRoot;
        uint256 timestamp;
        bool verified;
    }

    mapping(uint256 => StateCommitment) public commitments;
    uint256 public latestCommittedBlock;
    address public committer;

    constructor(address _committer) {
        committer = _committer;
    }

    function commitState(uint256 blockNumber, bytes32 stateRoot, bytes32 hotStateRoot) external {
        require(msg.sender == committer, "Not authorized");
        require(blockNumber > latestCommittedBlock, "Already committed");
        commitments[blockNumber] = StateCommitment({
            stateRoot: stateRoot,
            hotStateRoot: hotStateRoot,
            timestamp: block.timestamp,
            verified: false
        });
        latestCommittedBlock = blockNumber;
    }

    function getStateRoot(uint256 blockNumber) external view override returns (bytes32) {
        return commitments[blockNumber].stateRoot;
    }

    function getLatestCommittedBlock() external view returns (uint256) {
        return latestCommittedBlock;
    }
}
