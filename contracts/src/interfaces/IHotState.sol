// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

interface IHotState {
    function read(bytes32 key) external view returns (bytes32);
    function write(bytes32 key, bytes32 value) external;
}
