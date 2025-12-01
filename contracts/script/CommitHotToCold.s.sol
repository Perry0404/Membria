// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {Script} from "forge-std/Script.sol";
import {CommitGateway} from "../src/offline/CommitGateway.sol";

contract CommitHotToCold is Script {
    function run() external {
        address gatewayAddress = vm.envAddress("GATEWAY_ADDRESS");
        CommitGateway gateway = CommitGateway(gatewayAddress);
        
        vm.startBroadcast();
        
        bytes32 stateRoot = keccak256("computed_state_root");
        bytes32 hotStateRoot = keccak256("hot_state_root");
        gateway.commitFromHot(block.number, stateRoot, hotStateRoot);
        
        vm.stopBroadcast();
    }
}
