// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

library BitPackLib {
    // ============================================================
    //                        PACK METHODS
    // ============================================================
    
    // Assumes bitIndex <= 255
    function packBool(bytes32 word, bool value, uint256 bitIndex) internal pure returns (bytes32 newWord, uint256 freeBitIndex) {
        assembly {
            let shift := sub(0xFF, bitIndex)
            newWord := or(word, shl(shift, value))
            freeBitIndex := add(bitIndex, 0x01)
        }
    }

    // Assumes bitIndex <= 96
    function packAddress(bytes32 word, address value, uint256 bitIndex) internal pure returns (bytes32 newWord, uint256 freeBitIndex) {
        assembly {
            let shift := sub(0x60, bitIndex)
            newWord := or(word, shl(shift, value))
            freeBitIndex := add(bitIndex, 0xA0)
        }
    }

    // Assumes bitIndex <= 248
    function packUint8(bytes32 word, uint8 value, uint256 bitIndex) internal pure returns (bytes32 newWord, uint256 freeBitIndex) {
        assembly {
            let shift := sub(0xF8, bitIndex)
            newWord := or(word, shl(shift, value))
            freeBitIndex := add(bitIndex, 0x08)
        }
    }

    // Assumes bitIndex <= 240
    function packUint16(bytes32 word, uint16 value, uint256 bitIndex) internal pure returns (bytes32 newWord, uint256 freeBitIndex) {
        assembly {
            let shift := sub(0xF0, bitIndex)
            newWord := or(word, shl(shift, value))
            freeBitIndex := add(bitIndex, 0x10)
        }
    }

    // Assumes bitIndex <= 232
    function packUint24(bytes32 word, uint24 value, uint256 bitIndex) internal pure returns (bytes32 newWord, uint256 freeBitIndex) {
        assembly {
            let shift := sub(0xE8, bitIndex)
            newWord := or(word, shl(shift, value))
            freeBitIndex := add(bitIndex, 0x18)
        }
    }

    // ============================================================
    //                       UNPACK METHODS
    // ============================================================

    // Assumes bitIndex is <= 255
    function unpackBool(bytes32 word, uint256 bitIndex) internal pure returns (bool value) {
        assembly {
            let shift := sub(0xFF, bitIndex)
            value := shr(shift, and(shl(shift, shr(0xFE, not(0))), word))
        }
    }

    // Assumes bitIndex is <= 96
    function unpackAddress(bytes32 word, uint256 bitIndex) internal pure returns (address value) {
        assembly {
            let shift := sub(0x60, bitIndex)
            value := shr(shift, and(shl(shift, shr(0x60, not(0))), word))
        }
    }

    // Assumes bitIndex is <= 248
    function unpackUint8(bytes32 word, uint256 bitIndex) internal pure returns (uint8 value) {
        assembly {
            let shift := sub(0xF8, bitIndex)
            value := shr(shift, and(shl(shift, shr(0xF8, not(0))), word))
        }
    }

    // Assumes bitIndex is <= 240
    function unpackUint16(bytes32 word, uint256 bitIndex) internal pure returns (uint16 value) {
        assembly {
            let shift := sub(0xF0, bitIndex)
            value := shr(shift, and(shl(shift, shr(0xF0, not(0))), word))
        }
    }

    // Assumes bitIndex is <= 232
    function unpackUint24(bytes32 word, uint256 bitIndex) internal pure returns (uint24 value) {
        assembly {
            let shift := sub(0xE8, bitIndex)
            value := shr(shift, and(shl(shift, shr(0xE8, not(0))), word))
        }
    }
}
