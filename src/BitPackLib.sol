// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

error InvalidBitIndex(); 

library BitPackLib {
    function packBool(bytes32 word, bool value, uint256 bitIndex) internal pure returns (bytes32 newWord, uint256 freeBitIndex) {
        if (bitIndex > 255) revert InvalidBitIndex();

        assembly {
            let shift := sub(255, bitIndex)
            newWord := or(word, shl(shift, value))
            freeBitIndex := add(bitIndex, 1)
        }
    }
}
