// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {Script} from "forge-std/Script.sol";
import {ColdStorage} from "../src/offline/ColdStorage.sol";
import {CommitGateway} from "../src/offline/CommitGateway.sol";
import {FinalityOracle} from "../src/offline/FinalityOracle.sol";

contract DeployOffline is Script {
    function run() external {
        address committer = vm.envAddress("COMMITTER_ADDRESS");
        
        vm.startBroadcast();
        
        ColdStorage coldStorage = new ColdStorage(committer);
        FinalityOracle oracle = new FinalityOracle(committer);
        CommitGateway gateway = new CommitGateway(address(coldStorage), committer);
        
        vm.stopBroadcast();
    }
}
