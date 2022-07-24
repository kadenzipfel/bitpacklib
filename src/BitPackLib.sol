// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

library BitPackLib {
    // ============================================================
    //                        PACK METHODS
    // ============================================================
    
    // Assumes bitIndex < 256
    function packBool(bytes32 word, bool value, uint256 bitIndex) internal pure returns (bytes32 newWord, uint256 freeBitIndex) {
        assembly {
            let shift := sub(0xFE, bitIndex)
            newWord := or(word, shl(shift, value))
            freeBitIndex := add(bitIndex, 0x01)
        }
    }

    // Assumes bitIndex < 96
    function packAddress(bytes32 word, address value, uint256 bitIndex) internal pure returns (bytes32 newWord, uint256 freeBitIndex) {
        assembly {
            let shift := sub(0x60, bitIndex)
            newWord := or(word, shl(shift, value))
            freeBitIndex := add(bitIndex, 0xA0)
        }
    }

    // ============================================================
    //                       UNPACK METHODS
    // ============================================================

    // Assumes bitIndex is < 255
    function unpackBool(bytes32 word, uint256 bitIndex) internal pure returns (bool value) {
        assembly {
            let shift := sub(0xFE, bitIndex)
            value := shr(shift, and(shl(shift, shr(0xFE, not(0))), word))
        }
    }
}
