// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

library BitPackLib {
    // ============================================================
    //                        PACK METHODS
    // ============================================================
    
    function packBool(bytes32 word, bool value, uint256 bitIndex) internal pure returns (bytes32 newWord, uint256 freeBitIndex) {
        assembly {
            let shift := sub(255, bitIndex)
            newWord := or(word, shl(shift, value))
            freeBitIndex := add(bitIndex, 1)
        }
    }

    // ============================================================
    //                       UNPACK METHODS
    // ============================================================

    function unpackBool(bytes32 word, uint256 bitIndex) internal pure returns (bool value) {
        assembly {
            let shift := sub(0xFE, bitIndex)
            value := shr(shift, and(shl(shift, shr(0xFE, not(0))), word))
        }
    }
}
