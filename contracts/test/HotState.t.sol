// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {Test} from "forge-std/Test.sol";
import {HotStorage} from "../src/online/HotStorage.sol";

contract HotStateTest is Test {
    HotStorage hotStorage;

    function setUp() public {
        hotStorage = new HotStorage();
    }

    function test_WriteAndRead() public {
        bytes32 key = keccak256("test");
        bytes32 value = bytes32(uint256(42));
        
        hotStorage.write(key, value);
        assertEq(hotStorage.read(key), value);
    }

    function test_Exists() public {
        bytes32 key = keccak256("test");
        assertFalse(hotStorage.exists(key));
        
        hotStorage.write(key, bytes32(uint256(1)));
        assertTrue(hotStorage.exists(key));
    }
}
