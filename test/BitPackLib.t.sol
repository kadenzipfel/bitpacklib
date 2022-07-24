// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "./mock/BitPackLibMock.sol";

contract BitPackLibTest is Test {
    BitPackLibMock bpli;

    function setUp() public {
        bpli = new BitPackLibMock();
    }

    // PACK/UNPACK BOOL
    function testPackBool() public {
        (bytes32 newWord, uint256 freeBitIndex) = bpli.packBool(bytes32(0), true, 0);

        assertEq(newWord, 0x8000000000000000000000000000000000000000000000000000000000000000);
        assertEq(freeBitIndex, 1);
    }

    function testUnpackBool() public {
        (bytes32 newWord, ) = bpli.packBool(bytes32(0), true, 0);
        bool value = bpli.unpackBool(newWord, 0);
        assertEq(value, true);
    }

    function testPackUnpackBool(bool value, uint8 bitIndex) public {
        (bytes32 newWord, ) = bpli.packBool(bytes32(0), value, bitIndex);
        bool newValue = bpli.unpackBool(newWord, bitIndex);
        assertEq(newValue, value);
    }

    // PACK/UNPACK ADDRESS
    function testPackAddress() public {
        (bytes32 newWord, uint256 freeBitIndex) = bpli.packAddress(bytes32(0), address(0xBEeFbeefbEefbeEFbeEfbEEfBEeFbeEfBeEfBeef), 0);

        assertEq(newWord, 0xBEEFBEEFBEEFBEEFBEEFBEEFBEEFBEEFBEEFBEEF000000000000000000000000);
        assertEq(freeBitIndex, 160);
    }

    function testUnpackAddress() public {
        (bytes32 newWord, ) = bpli.packAddress(bytes32(0), address(0xBEeFbeefbEefbeEFbeEfbEEfBEeFbeEfBeEfBeef), 0);
        address value = bpli.unpackAddress(newWord, 0);
        assertEq(value, address(0xBEeFbeefbEefbeEFbeEfbEEfBEeFbeEfBeEfBeef));
    }

    function testPackUnpackAddress(address value, uint8 bitIndex) public {
        vm.assume(bitIndex <= 96);
        (bytes32 newWord, ) = bpli.packAddress(bytes32(0), value, bitIndex);
        address newValue = bpli.unpackAddress(newWord, bitIndex);
        assertEq(newValue, value);
    }
}
