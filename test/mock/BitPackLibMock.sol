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

    function packAddress(bytes32 word, address value, uint256 bitIndex) public pure returns (bytes32 newWord, uint256 freeBitIndex) {
        return BitPackLib.packAddress(word, value, bitIndex);
    }

    function packUint8(bytes32 word, uint8 value, uint256 bitIndex) public pure returns (bytes32 newWord, uint256 freeBitIndex) {
        return BitPackLib.packUint8(word, value, bitIndex);
    }

    function packUint16(bytes32 word, uint16 value, uint256 bitIndex) public pure returns (bytes32 newWord, uint256 freeBitIndex) {
        return BitPackLib.packUint16(word, value, bitIndex);
    }

    function packUint24(bytes32 word, uint24 value, uint256 bitIndex) public pure returns (bytes32 newWord, uint256 freeBitIndex) {
        return BitPackLib.packUint24(word, value, bitIndex);
    }

    // ============================================================
    //                       UNPACK METHODS
    // ============================================================
    
    function unpackBool(bytes32 word, uint256 bitIndex) public pure returns (bool value) {
        return BitPackLib.unpackBool(word, bitIndex);
    }

    function unpackAddress(bytes32 word, uint256 bitIndex) public pure returns (address value) {
        return BitPackLib.unpackAddress(word, bitIndex);
    }

    function unpackUint8(bytes32 word, uint256 bitIndex) public pure returns (uint8 value) {
        return BitPackLib.unpackUint8(word, bitIndex);
    }

    function unpackUint16(bytes32 word, uint256 bitIndex) public pure returns (uint16 value) {
        return BitPackLib.unpackUint16(word, bitIndex);
    }

    function unpackUint24(bytes32 word, uint256 bitIndex) public pure returns (uint24 value) {
        return BitPackLib.unpackUint24(word, bitIndex);
    }
}