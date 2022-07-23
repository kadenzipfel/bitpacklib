// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/BitPackLib.sol";

contract BitPackLibImpl {
    function packBool(bytes32 word, bool value, uint256 bitIndex) public pure returns (bytes32 newWord, uint256 freeBitIndex) {
        return BitPackLib.packBool(word, value, bitIndex);
    }
}

contract BitPackLibTest is Test {
    BitPackLibImpl bpli;

    function setUp() public {
        bpli = new BitPackLibImpl();
    }

    function testPackBool() public {
        (bytes32 newWord, uint256 freeBitIndex) = bpli.packBool(bytes32(0), true, 0);

        assertEq(newWord, 0x8000000000000000000000000000000000000000000000000000000000000000);
        assertEq(freeBitIndex, 1);
    }
}
