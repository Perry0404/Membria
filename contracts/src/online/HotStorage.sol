// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {IHotState} from "../interfaces/IHotState.sol";

contract HotStorage is IHotState {
    mapping(bytes32 => bytes32) private hotState;
    mapping(bytes32 => bool) private written;
    uint256 private currentBlock;
    bytes32 private stateRoot;

    constructor() {
        currentBlock = block.number;
    }

    function read(bytes32 key) external view override returns (bytes32) {
        return hotState[key];
    }

    function write(bytes32 key, bytes32 value) external override {
        if (block.number != currentBlock) {
            currentBlock = block.number;
        }
        hotState[key] = value;
        written[key] = true;
    }

    function getCurrentBlockState() external view returns (bytes32) {
        return stateRoot;
    }

    function exists(bytes32 key) external view returns (bool) {
        return written[key];
    }
}
