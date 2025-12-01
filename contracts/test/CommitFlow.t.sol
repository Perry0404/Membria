// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {Test} from "forge-std/Test.sol";
import {ColdStorage} from "../src/offline/ColdStorage.sol";
import {CommitGateway} from "../src/offline/CommitGateway.sol";

contract CommitFlowTest is Test {
    ColdStorage coldStorage;
    CommitGateway gateway;
    address committer = address(0x1);

    function setUp() public {
        coldStorage = new ColdStorage(committer);
        gateway = new CommitGateway(address(coldStorage), committer);
    }

    function test_CommitFlow() public {
        bytes32 stateRoot = keccak256("state");
        bytes32 hotStateRoot = keccak256("hot");
        
        vm.prank(committer);
        vm.warp(block.timestamp + 301);
        gateway.commitFromHot(1, stateRoot, hotStateRoot);
        
        assertEq(coldStorage.getStateRoot(1), stateRoot);
    }
}
