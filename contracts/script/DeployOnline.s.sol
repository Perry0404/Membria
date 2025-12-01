// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {Script} from "forge-std/Script.sol";
import {HotStorage} from "../src/online/HotStorage.sol";
import {HotExecutor} from "../src/online/HotExecutor.sol";
import {HotToken} from "../src/online/HotToken.sol";

contract DeployOnline is Script {
    function run() external {
        vm.startBroadcast();
        
        HotStorage hotStorage = new HotStorage();
        HotExecutor hotExecutor = new HotExecutor();
        HotToken hotToken = new HotToken();
        
        vm.stopBroadcast();
    }
}
