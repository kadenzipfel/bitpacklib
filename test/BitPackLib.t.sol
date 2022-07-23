// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "./mock/BitPackLibMock.sol";

contract BitPackLibTest is Test {
    BitPackLibMock bpli;

    function setUp() public {
        bpli = new BitPackLibMock();
    }

    // ============================================================
    //                         PACK TESTS
    // ============================================================

    function testPackBool() public {
        (bytes32 newWord, uint256 freeBitIndex) = bpli.packBool(bytes32(0), true, 0);

        assertEq(newWord, 0x8000000000000000000000000000000000000000000000000000000000000000);
        assertEq(freeBitIndex, 1);
    }

    // ============================================================
    //                        UNPACK TESTS
    // ============================================================

    function testUnpackBool() public {
        (bytes32 newWord, ) = bpli.packBool(bytes32(0), true, 0);
        bool value = bpli.unpackBool(newWord, 0);
        assertEq(value, true);
    }
}
