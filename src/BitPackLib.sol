// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

/// @notice Simple bitpacking library
/// @dev Does not overwrite existing data,
///      does not validate bitIndex or word size.
/// @author https://github.com/kadenzipfel
library BitPackLib {
    // ============================================================
    //                        PACK METHODS
    // ============================================================

    /// @notice Packs a bool at a given index of a given word
    /// @dev Assumes bitIndex <= 255
    /// @param word bytes32 value to pack bool into
    /// @param value bool to be packed
    /// @param bitIndex index to pack value at in word
    /// @return newWord bytes32 value of updated word
    /// @return freeBitIndex index of next free bit in word
    function packBool(bytes32 word, bool value, uint256 bitIndex)
        internal
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        assembly {
            let shift := sub(0xFF, bitIndex)
            newWord := or(word, shl(shift, value))
            freeBitIndex := add(bitIndex, 0x01)
        }
    }

    /// @notice Packs an address at a given index of a given word
    /// @dev Assumes bitIndex <= 96
    /// @param word bytes32 value to pack address into
    /// @param value address to be packed
    /// @param bitIndex index to pack value at in word
    /// @return newWord bytes32 value of updated word
    /// @return freeBitIndex index of next free bit in word
    function packAddress(bytes32 word, address value, uint256 bitIndex)
        internal
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        assembly {
            let shift := sub(0x60, bitIndex)
            newWord := or(word, shl(shift, value))
            freeBitIndex := add(bitIndex, 0xA0)
        }
    }

    /// @notice Packs a uint8 at a given index of a given word
    /// @dev Assumes bitIndex <= 248
    /// @param word bytes32 value to pack uint into
    /// @param value uint8 to be packed
    /// @param bitIndex index to pack value at in word
    /// @return newWord bytes32 value of updated word
    /// @return freeBitIndex index of next free bit in word
    function packUint8(bytes32 word, uint8 value, uint256 bitIndex)
        internal
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        assembly {
          let shift := sub(0xf8, bitIndex)
          newWord := or(word, shl(shift, value))
          freeBitIndex := add(bitIndex, 0x8)
      }
    }

    /// @notice Packs a uint16 at a given index of a given word
    /// @dev Assumes bitIndex <= 240
    /// @param word bytes32 value to pack uint into
    /// @param value uint16 to be packed
    /// @param bitIndex index to pack value at in word
    /// @return newWord bytes32 value of updated word
    /// @return freeBitIndex index of next free bit in word
    function packUint16(bytes32 word, uint16 value, uint256 bitIndex)
        internal
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        assembly {
          let shift := sub(0xf0, bitIndex)
          newWord := or(word, shl(shift, value))
          freeBitIndex := add(bitIndex, 0x10)
      }
    }

    /// @notice Packs a uint24 at a given index of a given word
    /// @dev Assumes bitIndex <= 232
    /// @param word bytes32 value to pack uint into
    /// @param value uint24 to be packed
    /// @param bitIndex index to pack value at in word
    /// @return newWord bytes32 value of updated word
    /// @return freeBitIndex index of next free bit in word
    function packUint24(bytes32 word, uint24 value, uint256 bitIndex)
        internal
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        assembly {
          let shift := sub(0xe8, bitIndex)
          newWord := or(word, shl(shift, value))
          freeBitIndex := add(bitIndex, 0x18)
      }
    }

    /// @notice Packs a uint32 at a given index of a given word
    /// @dev Assumes bitIndex <= 224
    /// @param word bytes32 value to pack uint into
    /// @param value uint32 to be packed
    /// @param bitIndex index to pack value at in word
    /// @return newWord bytes32 value of updated word
    /// @return freeBitIndex index of next free bit in word
    function packUint32(bytes32 word, uint32 value, uint256 bitIndex)
        internal
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        assembly {
          let shift := sub(0xe0, bitIndex)
          newWord := or(word, shl(shift, value))
          freeBitIndex := add(bitIndex, 0x20)
      }
    }

    /// @notice Packs a uint40 at a given index of a given word
    /// @dev Assumes bitIndex <= 216
    /// @param word bytes32 value to pack uint into
    /// @param value uint40 to be packed
    /// @param bitIndex index to pack value at in word
    /// @return newWord bytes32 value of updated word
    /// @return freeBitIndex index of next free bit in word
    function packUint40(bytes32 word, uint40 value, uint256 bitIndex)
        internal
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        assembly {
          let shift := sub(0xd8, bitIndex)
          newWord := or(word, shl(shift, value))
          freeBitIndex := add(bitIndex, 0x28)
      }
    }

    /// @notice Packs a uint48 at a given index of a given word
    /// @dev Assumes bitIndex <= 208
    /// @param word bytes32 value to pack uint into
    /// @param value uint48 to be packed
    /// @param bitIndex index to pack value at in word
    /// @return newWord bytes32 value of updated word
    /// @return freeBitIndex index of next free bit in word
    function packUint48(bytes32 word, uint48 value, uint256 bitIndex)
        internal
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        assembly {
          let shift := sub(0xd0, bitIndex)
          newWord := or(word, shl(shift, value))
          freeBitIndex := add(bitIndex, 0x30)
      }
    }

    /// @notice Packs a uint56 at a given index of a given word
    /// @dev Assumes bitIndex <= 200
    /// @param word bytes32 value to pack uint into
    /// @param value uint56 to be packed
    /// @param bitIndex index to pack value at in word
    /// @return newWord bytes32 value of updated word
    /// @return freeBitIndex index of next free bit in word
    function packUint56(bytes32 word, uint56 value, uint256 bitIndex)
        internal
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        assembly {
          let shift := sub(0xc8, bitIndex)
          newWord := or(word, shl(shift, value))
          freeBitIndex := add(bitIndex, 0x38)
      }
    }

    /// @notice Packs a uint64 at a given index of a given word
    /// @dev Assumes bitIndex <= 192
    /// @param word bytes32 value to pack uint into
    /// @param value uint64 to be packed
    /// @param bitIndex index to pack value at in word
    /// @return newWord bytes32 value of updated word
    /// @return freeBitIndex index of next free bit in word
    function packUint64(bytes32 word, uint64 value, uint256 bitIndex)
        internal
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        assembly {
          let shift := sub(0xc0, bitIndex)
          newWord := or(word, shl(shift, value))
          freeBitIndex := add(bitIndex, 0x40)
      }
    }

    /// @notice Packs a uint72 at a given index of a given word
    /// @dev Assumes bitIndex <= 184
    /// @param word bytes32 value to pack uint into
    /// @param value uint72 to be packed
    /// @param bitIndex index to pack value at in word
    /// @return newWord bytes32 value of updated word
    /// @return freeBitIndex index of next free bit in word
    function packUint72(bytes32 word, uint72 value, uint256 bitIndex)
        internal
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        assembly {
          let shift := sub(0xb8, bitIndex)
          newWord := or(word, shl(shift, value))
          freeBitIndex := add(bitIndex, 0x48)
      }
    }

    /// @notice Packs a uint80 at a given index of a given word
    /// @dev Assumes bitIndex <= 176
    /// @param word bytes32 value to pack uint into
    /// @param value uint80 to be packed
    /// @param bitIndex index to pack value at in word
    /// @return newWord bytes32 value of updated word
    /// @return freeBitIndex index of next free bit in word
    function packUint80(bytes32 word, uint80 value, uint256 bitIndex)
        internal
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        assembly {
          let shift := sub(0xb0, bitIndex)
          newWord := or(word, shl(shift, value))
          freeBitIndex := add(bitIndex, 0x50)
      }
    }

    /// @notice Packs a uint88 at a given index of a given word
    /// @dev Assumes bitIndex <= 168
    /// @param word bytes32 value to pack uint into
    /// @param value uint88 to be packed
    /// @param bitIndex index to pack value at in word
    /// @return newWord bytes32 value of updated word
    /// @return freeBitIndex index of next free bit in word
    function packUint88(bytes32 word, uint88 value, uint256 bitIndex)
        internal
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        assembly {
          let shift := sub(0xa8, bitIndex)
          newWord := or(word, shl(shift, value))
          freeBitIndex := add(bitIndex, 0x58)
      }
    }

    /// @notice Packs a uint96 at a given index of a given word
    /// @dev Assumes bitIndex <= 160
    /// @param word bytes32 value to pack uint into
    /// @param value uint96 to be packed
    /// @param bitIndex index to pack value at in word
    /// @return newWord bytes32 value of updated word
    /// @return freeBitIndex index of next free bit in word
    function packUint96(bytes32 word, uint96 value, uint256 bitIndex)
        internal
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        assembly {
          let shift := sub(0xa0, bitIndex)
          newWord := or(word, shl(shift, value))
          freeBitIndex := add(bitIndex, 0x60)
      }
    }

    /// @notice Packs a uint104 at a given index of a given word
    /// @dev Assumes bitIndex <= 152
    /// @param word bytes32 value to pack uint into
    /// @param value uint104 to be packed
    /// @param bitIndex index to pack value at in word
    /// @return newWord bytes32 value of updated word
    /// @return freeBitIndex index of next free bit in word
    function packUint104(bytes32 word, uint104 value, uint256 bitIndex)
        internal
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        assembly {
          let shift := sub(0x98, bitIndex)
          newWord := or(word, shl(shift, value))
          freeBitIndex := add(bitIndex, 0x68)
      }
    }

    /// @notice Packs a uint112 at a given index of a given word
    /// @dev Assumes bitIndex <= 144
    /// @param word bytes32 value to pack uint into
    /// @param value uint112 to be packed
    /// @param bitIndex index to pack value at in word
    /// @return newWord bytes32 value of updated word
    /// @return freeBitIndex index of next free bit in word
    function packUint112(bytes32 word, uint112 value, uint256 bitIndex)
        internal
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        assembly {
          let shift := sub(0x90, bitIndex)
          newWord := or(word, shl(shift, value))
          freeBitIndex := add(bitIndex, 0x70)
      }
    }

    /// @notice Packs a uint120 at a given index of a given word
    /// @dev Assumes bitIndex <= 136
    /// @param word bytes32 value to pack uint into
    /// @param value uint120 to be packed
    /// @param bitIndex index to pack value at in word
    /// @return newWord bytes32 value of updated word
    /// @return freeBitIndex index of next free bit in word
    function packUint120(bytes32 word, uint120 value, uint256 bitIndex)
        internal
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        assembly {
          let shift := sub(0x88, bitIndex)
          newWord := or(word, shl(shift, value))
          freeBitIndex := add(bitIndex, 0x78)
      }
    }

    /// @notice Packs a uint128 at a given index of a given word
    /// @dev Assumes bitIndex <= 128
    /// @param word bytes32 value to pack uint into
    /// @param value uint128 to be packed
    /// @param bitIndex index to pack value at in word
    /// @return newWord bytes32 value of updated word
    /// @return freeBitIndex index of next free bit in word
    function packUint128(bytes32 word, uint128 value, uint256 bitIndex)
        internal
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        assembly {
          let shift := sub(0x80, bitIndex)
          newWord := or(word, shl(shift, value))
          freeBitIndex := add(bitIndex, 0x80)
      }
    }

    /// @notice Packs a uint136 at a given index of a given word
    /// @dev Assumes bitIndex <= 120
    /// @param word bytes32 value to pack uint into
    /// @param value uint136 to be packed
    /// @param bitIndex index to pack value at in word
    /// @return newWord bytes32 value of updated word
    /// @return freeBitIndex index of next free bit in word
    function packUint136(bytes32 word, uint136 value, uint256 bitIndex)
        internal
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        assembly {
          let shift := sub(0x78, bitIndex)
          newWord := or(word, shl(shift, value))
          freeBitIndex := add(bitIndex, 0x88)
      }
    }

    /// @notice Packs a uint144 at a given index of a given word
    /// @dev Assumes bitIndex <= 112
    /// @param word bytes32 value to pack uint into
    /// @param value uint144 to be packed
    /// @param bitIndex index to pack value at in word
    /// @return newWord bytes32 value of updated word
    /// @return freeBitIndex index of next free bit in word
    function packUint144(bytes32 word, uint144 value, uint256 bitIndex)
        internal
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        assembly {
          let shift := sub(0x70, bitIndex)
          newWord := or(word, shl(shift, value))
          freeBitIndex := add(bitIndex, 0x90)
      }
    }

    /// @notice Packs a uint152 at a given index of a given word
    /// @dev Assumes bitIndex <= 104
    /// @param word bytes32 value to pack uint into
    /// @param value uint152 to be packed
    /// @param bitIndex index to pack value at in word
    /// @return newWord bytes32 value of updated word
    /// @return freeBitIndex index of next free bit in word
    function packUint152(bytes32 word, uint152 value, uint256 bitIndex)
        internal
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        assembly {
          let shift := sub(0x68, bitIndex)
          newWord := or(word, shl(shift, value))
          freeBitIndex := add(bitIndex, 0x98)
      }
    }

    /// @notice Packs a uint160 at a given index of a given word
    /// @dev Assumes bitIndex <= 96
    /// @param word bytes32 value to pack uint into
    /// @param value uint160 to be packed
    /// @param bitIndex index to pack value at in word
    /// @return newWord bytes32 value of updated word
    /// @return freeBitIndex index of next free bit in word
    function packUint160(bytes32 word, uint160 value, uint256 bitIndex)
        internal
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        assembly {
          let shift := sub(0x60, bitIndex)
          newWord := or(word, shl(shift, value))
          freeBitIndex := add(bitIndex, 0xa0)
      }
    }

    /// @notice Packs a uint168 at a given index of a given word
    /// @dev Assumes bitIndex <= 88
    /// @param word bytes32 value to pack uint into
    /// @param value uint168 to be packed
    /// @param bitIndex index to pack value at in word
    /// @return newWord bytes32 value of updated word
    /// @return freeBitIndex index of next free bit in word
    function packUint168(bytes32 word, uint168 value, uint256 bitIndex)
        internal
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        assembly {
          let shift := sub(0x58, bitIndex)
          newWord := or(word, shl(shift, value))
          freeBitIndex := add(bitIndex, 0xa8)
      }
    }

    /// @notice Packs a uint176 at a given index of a given word
    /// @dev Assumes bitIndex <= 80
    /// @param word bytes32 value to pack uint into
    /// @param value uint176 to be packed
    /// @param bitIndex index to pack value at in word
    /// @return newWord bytes32 value of updated word
    /// @return freeBitIndex index of next free bit in word
    function packUint176(bytes32 word, uint176 value, uint256 bitIndex)
        internal
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        assembly {
          let shift := sub(0x50, bitIndex)
          newWord := or(word, shl(shift, value))
          freeBitIndex := add(bitIndex, 0xb0)
      }
    }

    /// @notice Packs a uint184 at a given index of a given word
    /// @dev Assumes bitIndex <= 72
    /// @param word bytes32 value to pack uint into
    /// @param value uint184 to be packed
    /// @param bitIndex index to pack value at in word
    /// @return newWord bytes32 value of updated word
    /// @return freeBitIndex index of next free bit in word
    function packUint184(bytes32 word, uint184 value, uint256 bitIndex)
        internal
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        assembly {
          let shift := sub(0x48, bitIndex)
          newWord := or(word, shl(shift, value))
          freeBitIndex := add(bitIndex, 0xb8)
      }
    }

    /// @notice Packs a uint192 at a given index of a given word
    /// @dev Assumes bitIndex <= 64
    /// @param word bytes32 value to pack uint into
    /// @param value uint192 to be packed
    /// @param bitIndex index to pack value at in word
    /// @return newWord bytes32 value of updated word
    /// @return freeBitIndex index of next free bit in word
    function packUint192(bytes32 word, uint192 value, uint256 bitIndex)
        internal
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        assembly {
          let shift := sub(0x40, bitIndex)
          newWord := or(word, shl(shift, value))
          freeBitIndex := add(bitIndex, 0xc0)
      }
    }

    /// @notice Packs a uint200 at a given index of a given word
    /// @dev Assumes bitIndex <= 56
    /// @param word bytes32 value to pack uint into
    /// @param value uint200 to be packed
    /// @param bitIndex index to pack value at in word
    /// @return newWord bytes32 value of updated word
    /// @return freeBitIndex index of next free bit in word
    function packUint200(bytes32 word, uint200 value, uint256 bitIndex)
        internal
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        assembly {
          let shift := sub(0x38, bitIndex)
          newWord := or(word, shl(shift, value))
          freeBitIndex := add(bitIndex, 0xc8)
      }
    }

    /// @notice Packs a uint208 at a given index of a given word
    /// @dev Assumes bitIndex <= 48
    /// @param word bytes32 value to pack uint into
    /// @param value uint208 to be packed
    /// @param bitIndex index to pack value at in word
    /// @return newWord bytes32 value of updated word
    /// @return freeBitIndex index of next free bit in word
    function packUint208(bytes32 word, uint208 value, uint256 bitIndex)
        internal
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        assembly {
          let shift := sub(0x30, bitIndex)
          newWord := or(word, shl(shift, value))
          freeBitIndex := add(bitIndex, 0xd0)
      }
    }

    /// @notice Packs a uint216 at a given index of a given word
    /// @dev Assumes bitIndex <= 40
    /// @param word bytes32 value to pack uint into
    /// @param value uint216 to be packed
    /// @param bitIndex index to pack value at in word
    /// @return newWord bytes32 value of updated word
    /// @return freeBitIndex index of next free bit in word
    function packUint216(bytes32 word, uint216 value, uint256 bitIndex)
        internal
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        assembly {
          let shift := sub(0x28, bitIndex)
          newWord := or(word, shl(shift, value))
          freeBitIndex := add(bitIndex, 0xd8)
      }
    }

    /// @notice Packs a uint224 at a given index of a given word
    /// @dev Assumes bitIndex <= 32
    /// @param word bytes32 value to pack uint into
    /// @param value uint224 to be packed
    /// @param bitIndex index to pack value at in word
    /// @return newWord bytes32 value of updated word
    /// @return freeBitIndex index of next free bit in word
    function packUint224(bytes32 word, uint224 value, uint256 bitIndex)
        internal
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        assembly {
          let shift := sub(0x20, bitIndex)
          newWord := or(word, shl(shift, value))
          freeBitIndex := add(bitIndex, 0xe0)
      }
    }

    /// @notice Packs a uint232 at a given index of a given word
    /// @dev Assumes bitIndex <= 24
    /// @param word bytes32 value to pack uint into
    /// @param value uint232 to be packed
    /// @param bitIndex index to pack value at in word
    /// @return newWord bytes32 value of updated word
    /// @return freeBitIndex index of next free bit in word
    function packUint232(bytes32 word, uint232 value, uint256 bitIndex)
        internal
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        assembly {
          let shift := sub(0x18, bitIndex)
          newWord := or(word, shl(shift, value))
          freeBitIndex := add(bitIndex, 0xe8)
      }
    }

    /// @notice Packs a uint240 at a given index of a given word
    /// @dev Assumes bitIndex <= 16
    /// @param word bytes32 value to pack uint into
    /// @param value uint240 to be packed
    /// @param bitIndex index to pack value at in word
    /// @return newWord bytes32 value of updated word
    /// @return freeBitIndex index of next free bit in word
    function packUint240(bytes32 word, uint240 value, uint256 bitIndex)
        internal
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        assembly {
          let shift := sub(0x10, bitIndex)
          newWord := or(word, shl(shift, value))
          freeBitIndex := add(bitIndex, 0xf0)
      }
    }

    /// @notice Packs a uint248 at a given index of a given word
    /// @dev Assumes bitIndex <= 8
    /// @param word bytes32 value to pack uint into
    /// @param value uint248 to be packed
    /// @param bitIndex index to pack value at in word
    /// @return newWord bytes32 value of updated word
    /// @return freeBitIndex index of next free bit in word
    function packUint248(bytes32 word, uint248 value, uint256 bitIndex)
        internal
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        assembly {
          let shift := sub(0x8, bitIndex)
          newWord := or(word, shl(shift, value))
          freeBitIndex := add(bitIndex, 0xf8)
      }
    }

    /// @notice Packs a int8 at a given index of a given word
    /// @dev Assumes bitIndex <= 248
    /// @param word bytes32 value to pack int into
    /// @param value int8 to be packed
    /// @param bitIndex index to pack value at in word
    /// @return newWord bytes32 value of updated word
    /// @return freeBitIndex index of next free bit in word
    function packInt8(bytes32 word, int8 value, uint256 bitIndex)
        internal
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        assembly {
          let shift := sub(0xf8, bitIndex)
          newWord := or(word, shl(shift, value))
          freeBitIndex := add(bitIndex, 0x8)
      }
    }

    /// @notice Packs a int16 at a given index of a given word
    /// @dev Assumes bitIndex <= 240
    /// @param word bytes32 value to pack int into
    /// @param value int16 to be packed
    /// @param bitIndex index to pack value at in word
    /// @return newWord bytes32 value of updated word
    /// @return freeBitIndex index of next free bit in word
    function packInt16(bytes32 word, int16 value, uint256 bitIndex)
        internal
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        assembly {
          let shift := sub(0xf0, bitIndex)
          newWord := or(word, shl(shift, value))
          freeBitIndex := add(bitIndex, 0x10)
      }
    }

    /// @notice Packs a int24 at a given index of a given word
    /// @dev Assumes bitIndex <= 232
    /// @param word bytes32 value to pack int into
    /// @param value int24 to be packed
    /// @param bitIndex index to pack value at in word
    /// @return newWord bytes32 value of updated word
    /// @return freeBitIndex index of next free bit in word
    function packInt24(bytes32 word, int24 value, uint256 bitIndex)
        internal
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        assembly {
          let shift := sub(0xe8, bitIndex)
          newWord := or(word, shl(shift, value))
          freeBitIndex := add(bitIndex, 0x18)
      }
    }

    /// @notice Packs a int32 at a given index of a given word
    /// @dev Assumes bitIndex <= 224
    /// @param word bytes32 value to pack int into
    /// @param value int32 to be packed
    /// @param bitIndex index to pack value at in word
    /// @return newWord bytes32 value of updated word
    /// @return freeBitIndex index of next free bit in word
    function packInt32(bytes32 word, int32 value, uint256 bitIndex)
        internal
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        assembly {
          let shift := sub(0xe0, bitIndex)
          newWord := or(word, shl(shift, value))
          freeBitIndex := add(bitIndex, 0x20)
      }
    }

    /// @notice Packs a int40 at a given index of a given word
    /// @dev Assumes bitIndex <= 216
    /// @param word bytes32 value to pack int into
    /// @param value int40 to be packed
    /// @param bitIndex index to pack value at in word
    /// @return newWord bytes32 value of updated word
    /// @return freeBitIndex index of next free bit in word
    function packInt40(bytes32 word, int40 value, uint256 bitIndex)
        internal
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        assembly {
          let shift := sub(0xd8, bitIndex)
          newWord := or(word, shl(shift, value))
          freeBitIndex := add(bitIndex, 0x28)
      }
    }

    /// @notice Packs a int48 at a given index of a given word
    /// @dev Assumes bitIndex <= 208
    /// @param word bytes32 value to pack int into
    /// @param value int48 to be packed
    /// @param bitIndex index to pack value at in word
    /// @return newWord bytes32 value of updated word
    /// @return freeBitIndex index of next free bit in word
    function packInt48(bytes32 word, int48 value, uint256 bitIndex)
        internal
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        assembly {
          let shift := sub(0xd0, bitIndex)
          newWord := or(word, shl(shift, value))
          freeBitIndex := add(bitIndex, 0x30)
      }
    }

    /// @notice Packs a int56 at a given index of a given word
    /// @dev Assumes bitIndex <= 200
    /// @param word bytes32 value to pack int into
    /// @param value int56 to be packed
    /// @param bitIndex index to pack value at in word
    /// @return newWord bytes32 value of updated word
    /// @return freeBitIndex index of next free bit in word
    function packInt56(bytes32 word, int56 value, uint256 bitIndex)
        internal
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        assembly {
          let shift := sub(0xc8, bitIndex)
          newWord := or(word, shl(shift, value))
          freeBitIndex := add(bitIndex, 0x38)
      }
    }

    /// @notice Packs a int64 at a given index of a given word
    /// @dev Assumes bitIndex <= 192
    /// @param word bytes32 value to pack int into
    /// @param value int64 to be packed
    /// @param bitIndex index to pack value at in word
    /// @return newWord bytes32 value of updated word
    /// @return freeBitIndex index of next free bit in word
    function packInt64(bytes32 word, int64 value, uint256 bitIndex)
        internal
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        assembly {
          let shift := sub(0xc0, bitIndex)
          newWord := or(word, shl(shift, value))
          freeBitIndex := add(bitIndex, 0x40)
      }
    }

    // @notice Packs a int72 at a given index of a given word
    /// @dev Assumes bitIndex <= 184
    /// @param word bytes32 value to pack int into
    /// @param value int72 to be packed
    /// @param bitIndex index to pack value at in word
    /// @return newWord bytes32 value of updated word
    /// @return freeBitIndex index of next free bit in word
    function packInt72(bytes32 word, int72 value, uint256 bitIndex)
        internal
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        assembly {
          let shift := sub(0xb8, bitIndex)
          newWord := or(word, shl(shift, value))
          freeBitIndex := add(bitIndex, 0x48)
      }
    }

    /// @notice Packs a int80 at a given index of a given word
    /// @dev Assumes bitIndex <= 176
    /// @param word bytes32 value to pack int into
    /// @param value int80 to be packed
    /// @param bitIndex index to pack value at in word
    /// @return newWord bytes32 value of updated word
    /// @return freeBitIndex index of next free bit in word
    function packInt80(bytes32 word, int80 value, uint256 bitIndex)
        internal
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        assembly {
          let shift := sub(0xb0, bitIndex)
          newWord := or(word, shl(shift, value))
          freeBitIndex := add(bitIndex, 0x50)
      }
    }

    /// @notice Packs a int88 at a given index of a given word
    /// @dev Assumes bitIndex <= 168
    /// @param word bytes32 value to pack int into
    /// @param value int88 to be packed
    /// @param bitIndex index to pack value at in word
    /// @return newWord bytes32 value of updated word
    /// @return freeBitIndex index of next free bit in word
    function packInt88(bytes32 word, int88 value, uint256 bitIndex)
        internal
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        assembly {
          let shift := sub(0xa8, bitIndex)
          newWord := or(word, shl(shift, value))
          freeBitIndex := add(bitIndex, 0x58)
      }
    }

    /// @notice Packs a int96 at a given index of a given word
    /// @dev Assumes bitIndex <= 160
    /// @param word bytes32 value to pack int into
    /// @param value int96 to be packed
    /// @param bitIndex index to pack value at in word
    /// @return newWord bytes32 value of updated word
    /// @return freeBitIndex index of next free bit in word
    function packInt96(bytes32 word, int96 value, uint256 bitIndex)
        internal
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        assembly {
          let shift := sub(0xa0, bitIndex)
          newWord := or(word, shl(shift, value))
          freeBitIndex := add(bitIndex, 0x60)
      }
    }

    /// @notice Packs a int104 at a given index of a given word
    /// @dev Assumes bitIndex <= 152
    /// @param word bytes32 value to pack int into
    /// @param value int104 to be packed
    /// @param bitIndex index to pack value at in word
    /// @return newWord bytes32 value of updated word
    /// @return freeBitIndex index of next free bit in word
    function packInt104(bytes32 word, int104 value, uint256 bitIndex)
        internal
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        assembly {
          let shift := sub(0x98, bitIndex)
          newWord := or(word, shl(shift, value))
          freeBitIndex := add(bitIndex, 0x68)
      }
    }

    /// @notice Packs a int112 at a given index of a given word
    /// @dev Assumes bitIndex <= 144
    /// @param word bytes32 value to pack int into
    /// @param value int112 to be packed
    /// @param bitIndex index to pack value at in word
    /// @return newWord bytes32 value of updated word
    /// @return freeBitIndex index of next free bit in word
    function packInt112(bytes32 word, int112 value, uint256 bitIndex)
        internal
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        assembly {
          let shift := sub(0x90, bitIndex)
          newWord := or(word, shl(shift, value))
          freeBitIndex := add(bitIndex, 0x70)
      }
    }

    /// @notice Packs a int120 at a given index of a given word
    /// @dev Assumes bitIndex <= 136
    /// @param word bytes32 value to pack int into
    /// @param value int120 to be packed
    /// @param bitIndex index to pack value at in word
    /// @return newWord bytes32 value of updated word
    /// @return freeBitIndex index of next free bit in word
    function packInt120(bytes32 word, int120 value, uint256 bitIndex)
        internal
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        assembly {
          let shift := sub(0x88, bitIndex)
          newWord := or(word, shl(shift, value))
          freeBitIndex := add(bitIndex, 0x78)
      }
    }

    /// @notice Packs a int128 at a given index of a given word
    /// @dev Assumes bitIndex <= 128
    /// @param word bytes32 value to pack int into
    /// @param value int128 to be packed
    /// @param bitIndex index to pack value at in word
    /// @return newWord bytes32 value of updated word
    /// @return freeBitIndex index of next free bit in word
    function packInt128(bytes32 word, int128 value, uint256 bitIndex)
        internal
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        assembly {
          let shift := sub(0x80, bitIndex)
          newWord := or(word, shl(shift, value))
          freeBitIndex := add(bitIndex, 0x80)
      }
    }

    /// @notice Packs a int136 at a given index of a given word
    /// @dev Assumes bitIndex <= 120
    /// @param word bytes32 value to pack int into
    /// @param value int136 to be packed
    /// @param bitIndex index to pack value at in word
    /// @return newWord bytes32 value of updated word
    /// @return freeBitIndex index of next free bit in word
    function packInt136(bytes32 word, int136 value, uint256 bitIndex)
        internal
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        assembly {
          let shift := sub(0x78, bitIndex)
          newWord := or(word, shl(shift, value))
          freeBitIndex := add(bitIndex, 0x88)
      }
    }

    /// @notice Packs a int144 at a given index of a given word
    /// @dev Assumes bitIndex <= 112
    /// @param word bytes32 value to pack int into
    /// @param value int144 to be packed
    /// @param bitIndex index to pack value at in word
    /// @return newWord bytes32 value of updated word
    /// @return freeBitIndex index of next free bit in word
    function packInt144(bytes32 word, int144 value, uint256 bitIndex)
        internal
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        assembly {
          let shift := sub(0x70, bitIndex)
          newWord := or(word, shl(shift, value))
          freeBitIndex := add(bitIndex, 0x90)
      }
    }

    /// @notice Packs a int152 at a given index of a given word
    /// @dev Assumes bitIndex <= 104
    /// @param word bytes32 value to pack int into
    /// @param value int152 to be packed
    /// @param bitIndex index to pack value at in word
    /// @return newWord bytes32 value of updated word
    /// @return freeBitIndex index of next free bit in word
    function packInt152(bytes32 word, int152 value, uint256 bitIndex)
        internal
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        assembly {
          let shift := sub(0x68, bitIndex)
          newWord := or(word, shl(shift, value))
          freeBitIndex := add(bitIndex, 0x98)
      }
    }

    /// @notice Packs a int160 at a given index of a given word
    /// @dev Assumes bitIndex <= 96
    /// @param word bytes32 value to pack int into
    /// @param value int160 to be packed
    /// @param bitIndex index to pack value at in word
    /// @return newWord bytes32 value of updated word
    /// @return freeBitIndex index of next free bit in word
    function packInt160(bytes32 word, int160 value, uint256 bitIndex)
        internal
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        assembly {
          let shift := sub(0x60, bitIndex)
          newWord := or(word, shl(shift, value))
          freeBitIndex := add(bitIndex, 0xa0)
      }
    }

    /// @notice Packs a int168 at a given index of a given word
    /// @dev Assumes bitIndex <= 88
    /// @param word bytes32 value to pack int into
    /// @param value int168 to be packed
    /// @param bitIndex index to pack value at in word
    /// @return newWord bytes32 value of updated word
    /// @return freeBitIndex index of next free bit in word
    function packInt168(bytes32 word, int168 value, uint256 bitIndex)
        internal
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        assembly {
          let shift := sub(0x58, bitIndex)
          newWord := or(word, shl(shift, value))
          freeBitIndex := add(bitIndex, 0xa8)
      }
    }

    /// @notice Packs a int176 at a given index of a given word
    /// @dev Assumes bitIndex <= 80
    /// @param word bytes32 value to pack int into
    /// @param value int176 to be packed
    /// @param bitIndex index to pack value at in word
    /// @return newWord bytes32 value of updated word
    /// @return freeBitIndex index of next free bit in word
    function packInt176(bytes32 word, int176 value, uint256 bitIndex)
        internal
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        assembly {
          let shift := sub(0x50, bitIndex)
          newWord := or(word, shl(shift, value))
          freeBitIndex := add(bitIndex, 0xb0)
      }
    }

    /// @notice Packs a int184 at a given index of a given word
    /// @dev Assumes bitIndex <= 72
    /// @param word bytes32 value to pack int into
    /// @param value int184 to be packed
    /// @param bitIndex index to pack value at in word
    /// @return newWord bytes32 value of updated word
    /// @return freeBitIndex index of next free bit in word
    function packInt184(bytes32 word, int184 value, uint256 bitIndex)
        internal
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        assembly {
          let shift := sub(0x48, bitIndex)
          newWord := or(word, shl(shift, value))
          freeBitIndex := add(bitIndex, 0xb8)
      }
    }

    /// @notice Packs a int192 at a given index of a given word
    /// @dev Assumes bitIndex <= 64
    /// @param word bytes32 value to pack int into
    /// @param value int192 to be packed
    /// @param bitIndex index to pack value at in word
    /// @return newWord bytes32 value of updated word
    /// @return freeBitIndex index of next free bit in word
    function packInt192(bytes32 word, int192 value, uint256 bitIndex)
        internal
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        assembly {
          let shift := sub(0x40, bitIndex)
          newWord := or(word, shl(shift, value))
          freeBitIndex := add(bitIndex, 0xc0)
      }
    }

    /// @notice Packs a int200 at a given index of a given word
    /// @dev Assumes bitIndex <= 56
    /// @param word bytes32 value to pack int into
    /// @param value int200 to be packed
    /// @param bitIndex index to pack value at in word
    /// @return newWord bytes32 value of updated word
    /// @return freeBitIndex index of next free bit in word
    function packInt200(bytes32 word, int200 value, uint256 bitIndex)
        internal
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        assembly {
          let shift := sub(0x38, bitIndex)
          newWord := or(word, shl(shift, value))
          freeBitIndex := add(bitIndex, 0xc8)
      }
    }

    /// @notice Packs a int208 at a given index of a given word
    /// @dev Assumes bitIndex <= 48
    /// @param word bytes32 value to pack int into
    /// @param value int208 to be packed
    /// @param bitIndex index to pack value at in word
    /// @return newWord bytes32 value of updated word
    /// @return freeBitIndex index of next free bit in word
    function packInt208(bytes32 word, int208 value, uint256 bitIndex)
        internal
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        assembly {
          let shift := sub(0x30, bitIndex)
          newWord := or(word, shl(shift, value))
          freeBitIndex := add(bitIndex, 0xd0)
      }
    }

    /// @notice Packs a int216 at a given index of a given word
    /// @dev Assumes bitIndex <= 40
    /// @param word bytes32 value to pack int into
    /// @param value int216 to be packed
    /// @param bitIndex index to pack value at in word
    /// @return newWord bytes32 value of updated word
    /// @return freeBitIndex index of next free bit in word
    function packInt216(bytes32 word, int216 value, uint256 bitIndex)
        internal
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        assembly {
          let shift := sub(0x28, bitIndex)
          newWord := or(word, shl(shift, value))
          freeBitIndex := add(bitIndex, 0xd8)
      }
    }

    /// @notice Packs a int224 at a given index of a given word
    /// @dev Assumes bitIndex <= 32
    /// @param word bytes32 value to pack int into
    /// @param value int224 to be packed
    /// @param bitIndex index to pack value at in word
    /// @return newWord bytes32 value of updated word
    /// @return freeBitIndex index of next free bit in word
    function packInt224(bytes32 word, int224 value, uint256 bitIndex)
        internal
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        assembly {
          let shift := sub(0x20, bitIndex)
          newWord := or(word, shl(shift, value))
          freeBitIndex := add(bitIndex, 0xe0)
      }
    }

    /// @notice Packs a int232 at a given index of a given word
    /// @dev Assumes bitIndex <= 24
    /// @param word bytes32 value to pack int into
    /// @param value int232 to be packed
    /// @param bitIndex index to pack value at in word
    /// @return newWord bytes32 value of updated word
    /// @return freeBitIndex index of next free bit in word
    function packInt232(bytes32 word, int232 value, uint256 bitIndex)
        internal
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        assembly {
          let shift := sub(0x18, bitIndex)
          newWord := or(word, shl(shift, value))
          freeBitIndex := add(bitIndex, 0xe8)
      }
    }

    /// @notice Packs a int240 at a given index of a given word
    /// @dev Assumes bitIndex <= 16
    /// @param word bytes32 value to pack int into
    /// @param value int240 to be packed
    /// @param bitIndex index to pack value at in word
    /// @return newWord bytes32 value of updated word
    /// @return freeBitIndex index of next free bit in word
    function packInt240(bytes32 word, int240 value, uint256 bitIndex)
        internal
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        assembly {
          let shift := sub(0x10, bitIndex)
          newWord := or(word, shl(shift, value))
          freeBitIndex := add(bitIndex, 0xf0)
      }
    }

    /// @notice Packs a int248 at a given index of a given word
    /// @dev Assumes bitIndex <= 8
    /// @param word bytes32 value to pack int into
    /// @param value int248 to be packed
    /// @param bitIndex index to pack value at in word
    /// @return newWord bytes32 value of updated word
    /// @return freeBitIndex index of next free bit in word
    function packInt248(bytes32 word, int248 value, uint256 bitIndex)
        internal
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        assembly {
          let shift := sub(0x8, bitIndex)
          newWord := or(word, shl(shift, value))
          freeBitIndex := add(bitIndex, 0xf8)
      }
    }

    // ============================================================
    //                       UNPACK METHODS
    // ============================================================

    /// @notice Unpacks a bool from a given index of a given word
    /// @dev Assumes bitIndex <= 255
    /// @param word bytes32 value to unpack bool from
    /// @param bitIndex index of value in word
    /// @return value unpacked bool value
    function unpackBool(bytes32 word, uint256 bitIndex)
        internal
        pure
        returns (bool value)
    {
        assembly {
            let shift := sub(0xFF, bitIndex)
            value := shr(shift, and(shl(shift, shr(0xFE, not(0))), word))
        }
    }

    /// @notice Unpacks an address from a given index of a given word
    /// @dev Assumes bitIndex <= 96
    /// @param word bytes32 value to unpack address from
    /// @param bitIndex index of value in word
    /// @return value unpacked address value
    function unpackAddress(bytes32 word, uint256 bitIndex)
        internal
        pure
        returns (address value)
    {
        assembly {
            let shift := sub(0x60, bitIndex)
            value := shr(shift, and(shl(shift, shr(0x60, not(0))), word))
        }
    }

    /// @notice Unpacks a uint8 from a given index of a given word
    /// @dev Assumes bitIndex <= 248
    /// @param word bytes32 value to unpack uint from
    /// @param bitIndex index of value in word
    /// @return value unpacked uint8 value
    function unpackUint8(bytes32 word, uint256 bitIndex)
        internal
        pure
        returns (uint8 value)
    {
        assembly {
          let shift := sub(0xf8, bitIndex)
          value := shr(shift, and(shl(shift, shr(0xf8, not(0))), word))
      }
    }

    /// @notice Unpacks a uint16 from a given index of a given word
    /// @dev Assumes bitIndex <= 240
    /// @param word bytes32 value to unpack uint from
    /// @param bitIndex index of value in word
    /// @return value unpacked uint16 value
    function unpackUint16(bytes32 word, uint256 bitIndex)
        internal
        pure
        returns (uint16 value)
    {
        assembly {
          let shift := sub(0xf0, bitIndex)
          value := shr(shift, and(shl(shift, shr(0xf0, not(0))), word))
      }
    }

    /// @notice Unpacks a uint24 from a given index of a given word
    /// @dev Assumes bitIndex <= 232
    /// @param word bytes32 value to unpack uint from
    /// @param bitIndex index of value in word
    /// @return value unpacked uint24 value
    function unpackUint24(bytes32 word, uint256 bitIndex)
        internal
        pure
        returns (uint24 value)
    {
        assembly {
          let shift := sub(0xe8, bitIndex)
          value := shr(shift, and(shl(shift, shr(0xe8, not(0))), word))
      }
    }

    /// @notice Unpacks a uint32 from a given index of a given word
    /// @dev Assumes bitIndex <= 224
    /// @param word bytes32 value to unpack uint from
    /// @param bitIndex index of value in word
    /// @return value unpacked uint32 value
    function unpackUint32(bytes32 word, uint256 bitIndex)
        internal
        pure
        returns (uint32 value)
    {
        assembly {
          let shift := sub(0xe0, bitIndex)
          value := shr(shift, and(shl(shift, shr(0xe0, not(0))), word))
      }
    }

    /// @notice Unpacks a uint40 from a given index of a given word
    /// @dev Assumes bitIndex <= 216
    /// @param word bytes32 value to unpack uint from
    /// @param bitIndex index of value in word
    /// @return value unpacked uint40 value
    function unpackUint40(bytes32 word, uint256 bitIndex)
        internal
        pure
        returns (uint40 value)
    {
        assembly {
          let shift := sub(0xd8, bitIndex)
          value := shr(shift, and(shl(shift, shr(0xd8, not(0))), word))
      }
    }

    /// @notice Unpacks a uint48 from a given index of a given word
    /// @dev Assumes bitIndex <= 208
    /// @param word bytes32 value to unpack uint from
    /// @param bitIndex index of value in word
    /// @return value unpacked uint48 value
    function unpackUint48(bytes32 word, uint256 bitIndex)
        internal
        pure
        returns (uint48 value)
    {
        assembly {
          let shift := sub(0xd0, bitIndex)
          value := shr(shift, and(shl(shift, shr(0xd0, not(0))), word))
      }
    }

    /// @notice Unpacks a uint56 from a given index of a given word
    /// @dev Assumes bitIndex <= 200
    /// @param word bytes32 value to unpack uint from
    /// @param bitIndex index of value in word
    /// @return value unpacked uint56 value
    function unpackUint56(bytes32 word, uint256 bitIndex)
        internal
        pure
        returns (uint56 value)
    {
        assembly {
          let shift := sub(0xc8, bitIndex)
          value := shr(shift, and(shl(shift, shr(0xc8, not(0))), word))
      }
    }

    /// @notice Unpacks a uint64 from a given index of a given word
    /// @dev Assumes bitIndex <= 192
    /// @param word bytes32 value to unpack uint from
    /// @param bitIndex index of value in word
    /// @return value unpacked uint64 value
    function unpackUint64(bytes32 word, uint256 bitIndex)
        internal
        pure
        returns (uint64 value)
    {
        assembly {
          let shift := sub(0xc0, bitIndex)
          value := shr(shift, and(shl(shift, shr(0xc0, not(0))), word))
      }
    }

    /// @notice Unpacks a uint72 from a given index of a given word
    /// @dev Assumes bitIndex <= 184
    /// @param word bytes32 value to unpack uint from
    /// @param bitIndex index of value in word
    /// @return value unpacked uint72 value
    function unpackUint72(bytes32 word, uint256 bitIndex)
        internal
        pure
        returns (uint72 value)
    {
        assembly {
          let shift := sub(0xb8, bitIndex)
          value := shr(shift, and(shl(shift, shr(0xb8, not(0))), word))
      }
    }

    /// @notice Unpacks a uint80 from a given index of a given word
    /// @dev Assumes bitIndex <= 176
    /// @param word bytes32 value to unpack uint from
    /// @param bitIndex index of value in word
    /// @return value unpacked uint80 value
    function unpackUint80(bytes32 word, uint256 bitIndex)
        internal
        pure
        returns (uint80 value)
    {
        assembly {
          let shift := sub(0xb0, bitIndex)
          value := shr(shift, and(shl(shift, shr(0xb0, not(0))), word))
      }
    }

    /// @notice Unpacks a uint88 from a given index of a given word
    /// @dev Assumes bitIndex <= 168
    /// @param word bytes32 value to unpack uint from
    /// @param bitIndex index of value in word
    /// @return value unpacked uint88 value
    function unpackUint88(bytes32 word, uint256 bitIndex)
        internal
        pure
        returns (uint88 value)
    {
        assembly {
          let shift := sub(0xa8, bitIndex)
          value := shr(shift, and(shl(shift, shr(0xa8, not(0))), word))
      }
    }

    /// @notice Unpacks a uint96 from a given index of a given word
    /// @dev Assumes bitIndex <= 160
    /// @param word bytes32 value to unpack uint from
    /// @param bitIndex index of value in word
    /// @return value unpacked uint96 value
    function unpackUint96(bytes32 word, uint256 bitIndex)
        internal
        pure
        returns (uint96 value)
    {
        assembly {
          let shift := sub(0xa0, bitIndex)
          value := shr(shift, and(shl(shift, shr(0xa0, not(0))), word))
      }
    }

    /// @notice Unpacks a uint104 from a given index of a given word
    /// @dev Assumes bitIndex <= 152
    /// @param word bytes32 value to unpack uint from
    /// @param bitIndex index of value in word
    /// @return value unpacked uint104 value
    function unpackUint104(bytes32 word, uint256 bitIndex)
        internal
        pure
        returns (uint104 value)
    {
        assembly {
          let shift := sub(0x98, bitIndex)
          value := shr(shift, and(shl(shift, shr(0x98, not(0))), word))
      }
    }

    /// @notice Unpacks a uint112 from a given index of a given word
    /// @dev Assumes bitIndex <= 144
    /// @param word bytes32 value to unpack uint from
    /// @param bitIndex index of value in word
    /// @return value unpacked uint112 value
    function unpackUint112(bytes32 word, uint256 bitIndex)
        internal
        pure
        returns (uint112 value)
    {
        assembly {
          let shift := sub(0x90, bitIndex)
          value := shr(shift, and(shl(shift, shr(0x90, not(0))), word))
      }
    }

    /// @notice Unpacks a uint120 from a given index of a given word
    /// @dev Assumes bitIndex <= 136
    /// @param word bytes32 value to unpack uint from
    /// @param bitIndex index of value in word
    /// @return value unpacked uint120 value
    function unpackUint120(bytes32 word, uint256 bitIndex)
        internal
        pure
        returns (uint120 value)
    {
        assembly {
          let shift := sub(0x88, bitIndex)
          value := shr(shift, and(shl(shift, shr(0x88, not(0))), word))
      }
    }

    /// @notice Unpacks a uint128 from a given index of a given word
    /// @dev Assumes bitIndex <= 128
    /// @param word bytes32 value to unpack uint from
    /// @param bitIndex index of value in word
    /// @return value unpacked uint128 value
    function unpackUint128(bytes32 word, uint256 bitIndex)
        internal
        pure
        returns (uint128 value)
    {
        assembly {
          let shift := sub(0x80, bitIndex)
          value := shr(shift, and(shl(shift, shr(0x80, not(0))), word))
      }
    }

    /// @notice Unpacks a uint136 from a given index of a given word
    /// @dev Assumes bitIndex <= 120
    /// @param word bytes32 value to unpack uint from
    /// @param bitIndex index of value in word
    /// @return value unpacked uint136 value
    function unpackUint136(bytes32 word, uint256 bitIndex)
        internal
        pure
        returns (uint136 value)
    {
        assembly {
          let shift := sub(0x78, bitIndex)
          value := shr(shift, and(shl(shift, shr(0x78, not(0))), word))
      }
    }

    /// @notice Unpacks a uint144 from a given index of a given word
    /// @dev Assumes bitIndex <= 112
    /// @param word bytes32 value to unpack uint from
    /// @param bitIndex index of value in word
    /// @return value unpacked uint144 value
    function unpackUint144(bytes32 word, uint256 bitIndex)
        internal
        pure
        returns (uint144 value)
    {
        assembly {
          let shift := sub(0x70, bitIndex)
          value := shr(shift, and(shl(shift, shr(0x70, not(0))), word))
      }
    }

    /// @notice Unpacks a uint152 from a given index of a given word
    /// @dev Assumes bitIndex <= 104
    /// @param word bytes32 value to unpack uint from
    /// @param bitIndex index of value in word
    /// @return value unpacked uint152 value
    function unpackUint152(bytes32 word, uint256 bitIndex)
        internal
        pure
        returns (uint152 value)
    {
        assembly {
          let shift := sub(0x68, bitIndex)
          value := shr(shift, and(shl(shift, shr(0x68, not(0))), word))
      }
    }

    /// @notice Unpacks a uint160 from a given index of a given word
    /// @dev Assumes bitIndex <= 96
    /// @param word bytes32 value to unpack uint from
    /// @param bitIndex index of value in word
    /// @return value unpacked uint160 value
    function unpackUint160(bytes32 word, uint256 bitIndex)
        internal
        pure
        returns (uint160 value)
    {
        assembly {
          let shift := sub(0x60, bitIndex)
          value := shr(shift, and(shl(shift, shr(0x60, not(0))), word))
      }
    }

    /// @notice Unpacks a uint168 from a given index of a given word
    /// @dev Assumes bitIndex <= 88
    /// @param word bytes32 value to unpack uint from
    /// @param bitIndex index of value in word
    /// @return value unpacked uint168 value
    function unpackUint168(bytes32 word, uint256 bitIndex)
        internal
        pure
        returns (uint168 value)
    {
        assembly {
          let shift := sub(0x58, bitIndex)
          value := shr(shift, and(shl(shift, shr(0x58, not(0))), word))
      }
    }

    /// @notice Unpacks a uint176 from a given index of a given word
    /// @dev Assumes bitIndex <= 80
    /// @param word bytes32 value to unpack uint from
    /// @param bitIndex index of value in word
    /// @return value unpacked uint176 value
    function unpackUint176(bytes32 word, uint256 bitIndex)
        internal
        pure
        returns (uint176 value)
    {
        assembly {
          let shift := sub(0x50, bitIndex)
          value := shr(shift, and(shl(shift, shr(0x50, not(0))), word))
      }
    }

    /// @notice Unpacks a uint184 from a given index of a given word
    /// @dev Assumes bitIndex <= 72
    /// @param word bytes32 value to unpack uint from
    /// @param bitIndex index of value in word
    /// @return value unpacked uint184 value
    function unpackUint184(bytes32 word, uint256 bitIndex)
        internal
        pure
        returns (uint184 value)
    {
        assembly {
          let shift := sub(0x48, bitIndex)
          value := shr(shift, and(shl(shift, shr(0x48, not(0))), word))
      }
    }

    /// @notice Unpacks a uint192 from a given index of a given word
    /// @dev Assumes bitIndex <= 64
    /// @param word bytes32 value to unpack uint from
    /// @param bitIndex index of value in word
    /// @return value unpacked uint192 value
    function unpackUint192(bytes32 word, uint256 bitIndex)
        internal
        pure
        returns (uint192 value)
    {
        assembly {
          let shift := sub(0x40, bitIndex)
          value := shr(shift, and(shl(shift, shr(0x40, not(0))), word))
      }
    }

    /// @notice Unpacks a uint200 from a given index of a given word
    /// @dev Assumes bitIndex <= 56
    /// @param word bytes32 value to unpack uint from
    /// @param bitIndex index of value in word
    /// @return value unpacked uint200 value
    function unpackUint200(bytes32 word, uint256 bitIndex)
        internal
        pure
        returns (uint200 value)
    {
        assembly {
          let shift := sub(0x38, bitIndex)
          value := shr(shift, and(shl(shift, shr(0x38, not(0))), word))
      }
    }

    /// @notice Unpacks a uint208 from a given index of a given word
    /// @dev Assumes bitIndex <= 48
    /// @param word bytes32 value to unpack uint from
    /// @param bitIndex index of value in word
    /// @return value unpacked uint208 value
    function unpackUint208(bytes32 word, uint256 bitIndex)
        internal
        pure
        returns (uint208 value)
    {
        assembly {
          let shift := sub(0x30, bitIndex)
          value := shr(shift, and(shl(shift, shr(0x30, not(0))), word))
      }
    }

    /// @notice Unpacks a uint216 from a given index of a given word
    /// @dev Assumes bitIndex <= 40
    /// @param word bytes32 value to unpack uint from
    /// @param bitIndex index of value in word
    /// @return value unpacked uint216 value
    function unpackUint216(bytes32 word, uint256 bitIndex)
        internal
        pure
        returns (uint216 value)
    {
        assembly {
          let shift := sub(0x28, bitIndex)
          value := shr(shift, and(shl(shift, shr(0x28, not(0))), word))
      }
    }

    /// @notice Unpacks a uint224 from a given index of a given word
    /// @dev Assumes bitIndex <= 32
    /// @param word bytes32 value to unpack uint from
    /// @param bitIndex index of value in word
    /// @return value unpacked uint224 value
    function unpackUint224(bytes32 word, uint256 bitIndex)
        internal
        pure
        returns (uint224 value)
    {
        assembly {
          let shift := sub(0x20, bitIndex)
          value := shr(shift, and(shl(shift, shr(0x20, not(0))), word))
      }
    }

    /// @notice Unpacks a uint232 from a given index of a given word
    /// @dev Assumes bitIndex <= 24
    /// @param word bytes32 value to unpack uint from
    /// @param bitIndex index of value in word
    /// @return value unpacked uint232 value
    function unpackUint232(bytes32 word, uint256 bitIndex)
        internal
        pure
        returns (uint232 value)
    {
        assembly {
          let shift := sub(0x18, bitIndex)
          value := shr(shift, and(shl(shift, shr(0x18, not(0))), word))
      }
    }

    /// @notice Unpacks a uint240 from a given index of a given word
    /// @dev Assumes bitIndex <= 16
    /// @param word bytes32 value to unpack uint from
    /// @param bitIndex index of value in word
    /// @return value unpacked uint240 value
    function unpackUint240(bytes32 word, uint256 bitIndex)
        internal
        pure
        returns (uint240 value)
    {
        assembly {
          let shift := sub(0x10, bitIndex)
          value := shr(shift, and(shl(shift, shr(0x10, not(0))), word))
      }
    }

    /// @notice Unpacks a uint248 from a given index of a given word
    /// @dev Assumes bitIndex <= 8
    /// @param word bytes32 value to unpack uint from
    /// @param bitIndex index of value in word
    /// @return value unpacked uint248 value
    function unpackUint248(bytes32 word, uint256 bitIndex)
        internal
        pure
        returns (uint248 value)
    {
        assembly {
          let shift := sub(0x8, bitIndex)
          value := shr(shift, and(shl(shift, shr(0x8, not(0))), word))
      }
    }

    /// @notice Unpacks an int8 from a given index of a given word
    /// @dev Assumes bitIndex <= 248
    /// @param word bytes32 value to unpack int from
    /// @param bitIndex index of value in word
    /// @return value unpacked int8 value
    function unpackInt8(bytes32 word, uint256 bitIndex)
        internal
        pure
        returns (int8 value)
    {
        assembly {
          let shift := sub(0xf8, bitIndex)
          value := shr(shift, and(shl(shift, shr(0xf8, not(0))), word))
      }
    }

    /// @notice Unpacks an int16 from a given index of a given word
    /// @dev Assumes bitIndex <= 240
    /// @param word bytes32 value to unpack int from
    /// @param bitIndex index of value in word
    /// @return value unpacked int16 value
    function unpackInt16(bytes32 word, uint256 bitIndex)
        internal
        pure
        returns (int16 value)
    {
        assembly {
          let shift := sub(0xf0, bitIndex)
          value := shr(shift, and(shl(shift, shr(0xf0, not(0))), word))
      }
    }

    /// @notice Unpacks an int24 from a given index of a given word
    /// @dev Assumes bitIndex <= 232
    /// @param word bytes32 value to unpack int from
    /// @param bitIndex index of value in word
    /// @return value unpacked int24 value
    function unpackInt24(bytes32 word, uint256 bitIndex)
        internal
        pure
        returns (int24 value)
    {
        assembly {
          let shift := sub(0xe8, bitIndex)
          value := shr(shift, and(shl(shift, shr(0xe8, not(0))), word))
      }
    }

    /// @notice Unpacks an int32 from a given index of a given word
    /// @dev Assumes bitIndex <= 224
    /// @param word bytes32 value to unpack int from
    /// @param bitIndex index of value in word
    /// @return value unpacked int32 value
    function unpackInt32(bytes32 word, uint256 bitIndex)
        internal
        pure
        returns (int32 value)
    {
        assembly {
          let shift := sub(0xe0, bitIndex)
          value := shr(shift, and(shl(shift, shr(0xe0, not(0))), word))
      }
    }

    /// @notice Unpacks an int40 from a given index of a given word
    /// @dev Assumes bitIndex <= 216
    /// @param word bytes32 value to unpack int from
    /// @param bitIndex index of value in word
    /// @return value unpacked int40 value
    function unpackInt40(bytes32 word, uint256 bitIndex)
        internal
        pure
        returns (int40 value)
    {
        assembly {
          let shift := sub(0xd8, bitIndex)
          value := shr(shift, and(shl(shift, shr(0xd8, not(0))), word))
      }
    }

    /// @notice Unpacks an int48 from a given index of a given word
    /// @dev Assumes bitIndex <= 208
    /// @param word bytes32 value to unpack int from
    /// @param bitIndex index of value in word
    /// @return value unpacked int48 value
    function unpackInt48(bytes32 word, uint256 bitIndex)
        internal
        pure
        returns (int48 value)
    {
        assembly {
          let shift := sub(0xd0, bitIndex)
          value := shr(shift, and(shl(shift, shr(0xd0, not(0))), word))
      }
    }

    /// @notice Unpacks an int56 from a given index of a given word
    /// @dev Assumes bitIndex <= 200
    /// @param word bytes32 value to unpack int from
    /// @param bitIndex index of value in word
    /// @return value unpacked int56 value
    function unpackInt56(bytes32 word, uint256 bitIndex)
        internal
        pure
        returns (int56 value)
    {
        assembly {
          let shift := sub(0xc8, bitIndex)
          value := shr(shift, and(shl(shift, shr(0xc8, not(0))), word))
      }
    }

    /// @notice Unpacks an int64 from a given index of a given word
    /// @dev Assumes bitIndex <= 192
    /// @param word bytes32 value to unpack int from
    /// @param bitIndex index of value in word
    /// @return value unpacked int64 value
    function unpackInt64(bytes32 word, uint256 bitIndex)
        internal
        pure
        returns (int64 value)
    {
        assembly {
          let shift := sub(0xc0, bitIndex)
          value := shr(shift, and(shl(shift, shr(0xc0, not(0))), word))
      }
    }

    /// @notice Unpacks an int72 from a given index of a given word
    /// @dev Assumes bitIndex <= 184
    /// @param word bytes32 value to unpack int from
    /// @param bitIndex index of value in word
    /// @return value unpacked int72 value
    function unpackInt72(bytes32 word, uint256 bitIndex)
        internal
        pure
        returns (int72 value)
    {
        assembly {
          let shift := sub(0xb8, bitIndex)
          value := shr(shift, and(shl(shift, shr(0xb8, not(0))), word))
      }
    }

    /// @notice Unpacks an int80 from a given index of a given word
    /// @dev Assumes bitIndex <= 176
    /// @param word bytes32 value to unpack int from
    /// @param bitIndex index of value in word
    /// @return value unpacked int80 value
    function unpackInt80(bytes32 word, uint256 bitIndex)
        internal
        pure
        returns (int80 value)
    {
        assembly {
          let shift := sub(0xb0, bitIndex)
          value := shr(shift, and(shl(shift, shr(0xb0, not(0))), word))
      }
    }

    /// @notice Unpacks an int88 from a given index of a given word
    /// @dev Assumes bitIndex <= 168
    /// @param word bytes32 value to unpack int from
    /// @param bitIndex index of value in word
    /// @return value unpacked int88 value
    function unpackInt88(bytes32 word, uint256 bitIndex)
        internal
        pure
        returns (int88 value)
    {
        assembly {
          let shift := sub(0xa8, bitIndex)
          value := shr(shift, and(shl(shift, shr(0xa8, not(0))), word))
      }
    }

    /// @notice Unpacks an int96 from a given index of a given word
    /// @dev Assumes bitIndex <= 160
    /// @param word bytes32 value to unpack int from
    /// @param bitIndex index of value in word
    /// @return value unpacked int96 value
    function unpackInt96(bytes32 word, uint256 bitIndex)
        internal
        pure
        returns (int96 value)
    {
        assembly {
          let shift := sub(0xa0, bitIndex)
          value := shr(shift, and(shl(shift, shr(0xa0, not(0))), word))
      }
    }

    /// @notice Unpacks an int104 from a given index of a given word
    /// @dev Assumes bitIndex <= 152
    /// @param word bytes32 value to unpack int from
    /// @param bitIndex index of value in word
    /// @return value unpacked int104 value
    function unpackInt104(bytes32 word, uint256 bitIndex)
        internal
        pure
        returns (int104 value)
    {
        assembly {
          let shift := sub(0x98, bitIndex)
          value := shr(shift, and(shl(shift, shr(0x98, not(0))), word))
      }
    }

    /// @notice Unpacks an int112 from a given index of a given word
    /// @dev Assumes bitIndex <= 144
    /// @param word bytes32 value to unpack int from
    /// @param bitIndex index of value in word
    /// @return value unpacked int112 value
    function unpackInt112(bytes32 word, uint256 bitIndex)
        internal
        pure
        returns (int112 value)
    {
        assembly {
          let shift := sub(0x90, bitIndex)
          value := shr(shift, and(shl(shift, shr(0x90, not(0))), word))
      }
    }

    /// @notice Unpacks an int120 from a given index of a given word
    /// @dev Assumes bitIndex <= 136
    /// @param word bytes32 value to unpack int from
    /// @param bitIndex index of value in word
    /// @return value unpacked int120 value
    function unpackInt120(bytes32 word, uint256 bitIndex)
        internal
        pure
        returns (int120 value)
    {
        assembly {
          let shift := sub(0x88, bitIndex)
          value := shr(shift, and(shl(shift, shr(0x88, not(0))), word))
      }
    }

    /// @notice Unpacks an int128 from a given index of a given word
    /// @dev Assumes bitIndex <= 128
    /// @param word bytes32 value to unpack int from
    /// @param bitIndex index of value in word
    /// @return value unpacked int128 value
    function unpackInt128(bytes32 word, uint256 bitIndex)
        internal
        pure
        returns (int128 value)
    {
        assembly {
          let shift := sub(0x80, bitIndex)
          value := shr(shift, and(shl(shift, shr(0x80, not(0))), word))
      }
    }

    /// @notice Unpacks an int136 from a given index of a given word
    /// @dev Assumes bitIndex <= 120
    /// @param word bytes32 value to unpack int from
    /// @param bitIndex index of value in word
    /// @return value unpacked int136 value
    function unpackInt136(bytes32 word, uint256 bitIndex)
        internal
        pure
        returns (int136 value)
    {
        assembly {
          let shift := sub(0x78, bitIndex)
          value := shr(shift, and(shl(shift, shr(0x78, not(0))), word))
      }
    }

    /// @notice Unpacks an int144 from a given index of a given word
    /// @dev Assumes bitIndex <= 112
    /// @param word bytes32 value to unpack int from
    /// @param bitIndex index of value in word
    /// @return value unpacked int144 value
    function unpackInt144(bytes32 word, uint256 bitIndex)
        internal
        pure
        returns (int144 value)
    {
        assembly {
          let shift := sub(0x70, bitIndex)
          value := shr(shift, and(shl(shift, shr(0x70, not(0))), word))
      }
    }

    /// @notice Unpacks an int152 from a given index of a given word
    /// @dev Assumes bitIndex <= 104
    /// @param word bytes32 value to unpack int from
    /// @param bitIndex index of value in word
    /// @return value unpacked int152 value
    function unpackInt152(bytes32 word, uint256 bitIndex)
        internal
        pure
        returns (int152 value)
    {
        assembly {
          let shift := sub(0x68, bitIndex)
          value := shr(shift, and(shl(shift, shr(0x68, not(0))), word))
      }
    }

    /// @notice Unpacks an int160 from a given index of a given word
    /// @dev Assumes bitIndex <= 96
    /// @param word bytes32 value to unpack int from
    /// @param bitIndex index of value in word
    /// @return value unpacked int160 value
    function unpackInt160(bytes32 word, uint256 bitIndex)
        internal
        pure
        returns (int160 value)
    {
        assembly {
          let shift := sub(0x60, bitIndex)
          value := shr(shift, and(shl(shift, shr(0x60, not(0))), word))
      }
    }

    /// @notice Unpacks an int168 from a given index of a given word
    /// @dev Assumes bitIndex <= 88
    /// @param word bytes32 value to unpack int from
    /// @param bitIndex index of value in word
    /// @return value unpacked int168 value
    function unpackInt168(bytes32 word, uint256 bitIndex)
        internal
        pure
        returns (int168 value)
    {
        assembly {
          let shift := sub(0x58, bitIndex)
          value := shr(shift, and(shl(shift, shr(0x58, not(0))), word))
      }
    }

    /// @notice Unpacks an int176 from a given index of a given word
    /// @dev Assumes bitIndex <= 80
    /// @param word bytes32 value to unpack int from
    /// @param bitIndex index of value in word
    /// @return value unpacked int176 value
    function unpackInt176(bytes32 word, uint256 bitIndex)
        internal
        pure
        returns (int176 value)
    {
        assembly {
          let shift := sub(0x50, bitIndex)
          value := shr(shift, and(shl(shift, shr(0x50, not(0))), word))
      }
    }

    /// @notice Unpacks an int184 from a given index of a given word
    /// @dev Assumes bitIndex <= 72
    /// @param word bytes32 value to unpack int from
    /// @param bitIndex index of value in word
    /// @return value unpacked int184 value
    function unpackInt184(bytes32 word, uint256 bitIndex)
        internal
        pure
        returns (int184 value)
    {
        assembly {
          let shift := sub(0x48, bitIndex)
          value := shr(shift, and(shl(shift, shr(0x48, not(0))), word))
      }
    }

    /// @notice Unpacks an int192 from a given index of a given word
    /// @dev Assumes bitIndex <= 64
    /// @param word bytes32 value to unpack int from
    /// @param bitIndex index of value in word
    /// @return value unpacked int192 value
    function unpackInt192(bytes32 word, uint256 bitIndex)
        internal
        pure
        returns (int192 value)
    {
        assembly {
          let shift := sub(0x40, bitIndex)
          value := shr(shift, and(shl(shift, shr(0x40, not(0))), word))
      }
    }

    /// @notice Unpacks an int200 from a given index of a given word
    /// @dev Assumes bitIndex <= 56
    /// @param word bytes32 value to unpack int from
    /// @param bitIndex index of value in word
    /// @return value unpacked int200 value
    function unpackInt200(bytes32 word, uint256 bitIndex)
        internal
        pure
        returns (int200 value)
    {
        assembly {
          let shift := sub(0x38, bitIndex)
          value := shr(shift, and(shl(shift, shr(0x38, not(0))), word))
      }
    }

    /// @notice Unpacks an int208 from a given index of a given word
    /// @dev Assumes bitIndex <= 48
    /// @param word bytes32 value to unpack int from
    /// @param bitIndex index of value in word
    /// @return value unpacked int208 value
    function unpackInt208(bytes32 word, uint256 bitIndex)
        internal
        pure
        returns (int208 value)
    {
        assembly {
          let shift := sub(0x30, bitIndex)
          value := shr(shift, and(shl(shift, shr(0x30, not(0))), word))
      }
    }

    /// @notice Unpacks an int216 from a given index of a given word
    /// @dev Assumes bitIndex <= 40
    /// @param word bytes32 value to unpack int from
    /// @param bitIndex index of value in word
    /// @return value unpacked int216 value
    function unpackInt216(bytes32 word, uint256 bitIndex)
        internal
        pure
        returns (int216 value)
    {
        assembly {
          let shift := sub(0x28, bitIndex)
          value := shr(shift, and(shl(shift, shr(0x28, not(0))), word))
      }
    }

    /// @notice Unpacks an int224 from a given index of a given word
    /// @dev Assumes bitIndex <= 32
    /// @param word bytes32 value to unpack int from
    /// @param bitIndex index of value in word
    /// @return value unpacked int224 value
    function unpackInt224(bytes32 word, uint256 bitIndex)
        internal
        pure
        returns (int224 value)
    {
        assembly {
          let shift := sub(0x20, bitIndex)
          value := shr(shift, and(shl(shift, shr(0x20, not(0))), word))
      }
    }

    /// @notice Unpacks an int232 from a given index of a given word
    /// @dev Assumes bitIndex <= 24
    /// @param word bytes32 value to unpack int from
    /// @param bitIndex index of value in word
    /// @return value unpacked int232 value
    function unpackInt232(bytes32 word, uint256 bitIndex)
        internal
        pure
        returns (int232 value)
    {
        assembly {
          let shift := sub(0x18, bitIndex)
          value := shr(shift, and(shl(shift, shr(0x18, not(0))), word))
        }
    }

    /// @notice Unpacks an int240 from a given index of a given word
    /// @dev Assumes bitIndex <= 16
    /// @param word bytes32 value to unpack int from
    /// @param bitIndex index of value in word
    /// @return value unpacked int240 value
    function unpackInt240(bytes32 word, uint256 bitIndex)
        internal
        pure
        returns (int240 value)
    {
        assembly {
          let shift := sub(0x10, bitIndex)
          value := shr(shift, and(shl(shift, shr(0x10, not(0))), word))
        }
    }

    /// @notice Unpacks an int248 from a given index of a given word
    /// @dev Assumes bitIndex <= 8
    /// @param word bytes32 value to unpack int from
    /// @param bitIndex index of value in word
    /// @return value unpacked int248 value
    function unpackInt248(bytes32 word, uint256 bitIndex)
        internal
        pure
        returns (int248 value)
    {
        assembly {
          let shift := sub(0x8, bitIndex)
          value := shr(shift, and(shl(shift, shr(0x8, not(0))), word))
        }
    }
}
