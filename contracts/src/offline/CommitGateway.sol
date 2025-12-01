// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {ColdStorage} from "./ColdStorage.sol";

contract CommitGateway {
    ColdStorage public coldStorage;
    address public oracle;
    uint256 public commitInterval = 300; // 5 minutes
    uint256 public lastCommitTime;

    constructor(address _coldStorage, address _oracle) {
        coldStorage = ColdStorage(_coldStorage);
        oracle = _oracle;
        lastCommitTime = block.timestamp;
    }

    function canCommit() external view returns (bool) {
        return block.timestamp >= lastCommitTime + commitInterval;
    }

    function commitFromHot(uint256 blockNumber, bytes32 stateRoot, bytes32 hotStateRoot) external {
        require(msg.sender == oracle, "Only oracle can commit");
        require(block.timestamp >= lastCommitTime + commitInterval, "Too soon");
        
        coldStorage.commitState(blockNumber, stateRoot, hotStateRoot);
        lastCommitTime = block.timestamp;
    }
}
