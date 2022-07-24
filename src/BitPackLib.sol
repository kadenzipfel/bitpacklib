// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

library BitPackLib {
    // ============================================================
    //                        PACK METHODS
    // ============================================================

    // Assumes bitIndex <= 255
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

    // Assumes bitIndex <= 96
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

    // Assumes bitIndex <= 248
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

    // Assumes bitIndex <= 240
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

    // Assumes bitIndex <= 232
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

    // Assumes bitIndex <= 224
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

    // Assumes bitIndex <= 216
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

    // Assumes bitIndex <= 208
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

    // Assumes bitIndex <= 200
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

    // Assumes bitIndex <= 192
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

    // Assumes bitIndex <= 184
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

    // Assumes bitIndex <= 176
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

    // Assumes bitIndex <= 168
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

    // Assumes bitIndex <= 160
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

    // Assumes bitIndex <= 152
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

    // Assumes bitIndex <= 144
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

    // Assumes bitIndex <= 136
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

    // Assumes bitIndex <= 128
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

    // Assumes bitIndex <= 120
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

    // Assumes bitIndex <= 112
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

    // Assumes bitIndex <= 104
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

    // Assumes bitIndex <= 96
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

    // Assumes bitIndex <= 88
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

    // Assumes bitIndex <= 80
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

    // Assumes bitIndex <= 72
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

    // Assumes bitIndex <= 64
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

    // Assumes bitIndex <= 56
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

    // Assumes bitIndex <= 48
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

    // Assumes bitIndex <= 40
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

    // Assumes bitIndex <= 32
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

    // Assumes bitIndex <= 24
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

    // Assumes bitIndex <= 16
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

    // Assumes bitIndex <= 8
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

    // Assumes bitIndex <= 248
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

    // Assumes bitIndex <= 240
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

    // Assumes bitIndex <= 232
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

    // Assumes bitIndex <= 224
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

    // Assumes bitIndex <= 216
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

    // Assumes bitIndex <= 208
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

    // Assumes bitIndex <= 200
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

    // Assumes bitIndex <= 192
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

    // Assumes bitIndex <= 184
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

    // Assumes bitIndex <= 176
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

    // Assumes bitIndex <= 168
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

    // Assumes bitIndex <= 160
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

    // Assumes bitIndex <= 152
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

    // Assumes bitIndex <= 144
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

    // Assumes bitIndex <= 136
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

    // Assumes bitIndex <= 128
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

    // Assumes bitIndex <= 120
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

    // Assumes bitIndex <= 112
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

    // Assumes bitIndex <= 104
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

    // Assumes bitIndex <= 96
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

    // Assumes bitIndex <= 88
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

    // Assumes bitIndex <= 80
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

    // Assumes bitIndex <= 72
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

    // Assumes bitIndex <= 64
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

    // Assumes bitIndex <= 56
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

    // Assumes bitIndex <= 48
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

    // Assumes bitIndex <= 40
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

    // Assumes bitIndex <= 32
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

    // Assumes bitIndex <= 24
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

    // Assumes bitIndex <= 16
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

    // Assumes bitIndex <= 8
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

    // Assumes bitIndex is <= 255
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

    // Assumes bitIndex is <= 96
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

    // Assumes bitIndex is <= 248
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

    // Assumes bitIndex is <= 240
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

    // Assumes bitIndex is <= 232
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

    // Assumes bitIndex is <= 224
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

    // Assumes bitIndex is <= 216
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

    // Assumes bitIndex is <= 208
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

    // Assumes bitIndex is <= 200
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

    // Assumes bitIndex is <= 192
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

    // Assumes bitIndex is <= 184
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

    // Assumes bitIndex is <= 176
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

    // Assumes bitIndex is <= 168
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

    // Assumes bitIndex is <= 160
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

    // Assumes bitIndex is <= 152
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

    // Assumes bitIndex is <= 144
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

    // Assumes bitIndex is <= 136
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

    // Assumes bitIndex is <= 128
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

    // Assumes bitIndex is <= 120
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

    // Assumes bitIndex is <= 112
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

    // Assumes bitIndex is <= 104
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

    // Assumes bitIndex is <= 96
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

    // Assumes bitIndex is <= 88
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

    // Assumes bitIndex is <= 80
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

    // Assumes bitIndex is <= 72
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

    // Assumes bitIndex is <= 64
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

    // Assumes bitIndex is <= 56
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

    // Assumes bitIndex is <= 48
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

    // Assumes bitIndex is <= 40
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

    // Assumes bitIndex is <= 32
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

    // Assumes bitIndex is <= 24
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

    // Assumes bitIndex is <= 16
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

    // Assumes bitIndex is <= 8
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

    // Assumes bitIndex is <= 248
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

    // Assumes bitIndex is <= 240
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

    // Assumes bitIndex is <= 232
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

    // Assumes bitIndex is <= 224
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

    // Assumes bitIndex is <= 216
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

    // Assumes bitIndex is <= 208
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

    // Assumes bitIndex is <= 200
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

    // Assumes bitIndex is <= 192
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

    // Assumes bitIndex is <= 184
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

    // Assumes bitIndex is <= 176
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

    // Assumes bitIndex is <= 168
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

    // Assumes bitIndex is <= 160
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

    // Assumes bitIndex is <= 152
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

    // Assumes bitIndex is <= 144
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

    // Assumes bitIndex is <= 136
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

    // Assumes bitIndex is <= 128
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

    // Assumes bitIndex is <= 120
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

    // Assumes bitIndex is <= 112
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

    // Assumes bitIndex is <= 104
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

    // Assumes bitIndex is <= 96
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

    // Assumes bitIndex is <= 88
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

    // Assumes bitIndex is <= 80
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

    // Assumes bitIndex is <= 72
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

    // Assumes bitIndex is <= 64
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

    // Assumes bitIndex is <= 56
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

    // Assumes bitIndex is <= 48
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

    // Assumes bitIndex is <= 40
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

    // Assumes bitIndex is <= 32
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

    // Assumes bitIndex is <= 24
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

    // Assumes bitIndex is <= 16
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

    // Assumes bitIndex is <= 8
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
