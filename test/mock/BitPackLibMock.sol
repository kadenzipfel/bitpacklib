// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "../../src/BitPackLib.sol";

contract BitPackLibMock {
    // ============================================================
    //                        PACK METHODS
    // ============================================================

    function packBool(bytes32 word, bool value, uint256 bitIndex) public pure returns (bytes32 newWord, uint256 freeBitIndex) {
        return BitPackLib.packBool(word, value, bitIndex);
    }

    // ============================================================
    //                       UNPACK METHODS
    // ============================================================
    
    function unpackBool(bytes32 word, uint256 bitIndex) public pure returns (bool value) {
        return BitPackLib.unpackBool(word, bitIndex);
    }
}