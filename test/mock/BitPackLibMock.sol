// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "../../src/BitPackLib.sol";

contract BitPackLibMock {
    // ============================================================
    //                        PACK METHODS
    // ============================================================

    function packBool(bytes32 word, bool value, uint256 bitIndex)
        public
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        return BitPackLib.packBool(word, value, bitIndex);
    }

    function packAddress(bytes32 word, address value, uint256 bitIndex)
        public
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        return BitPackLib.packAddress(word, value, bitIndex);
    }

    function packUint8(bytes32 word, uint8 value, uint256 bitIndex)
        public
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        return BitPackLib.packUint8(word, value, bitIndex);
    }

    function packUint16(bytes32 word, uint16 value, uint256 bitIndex)
        public
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        return BitPackLib.packUint16(word, value, bitIndex);
    }

    function packUint24(bytes32 word, uint24 value, uint256 bitIndex)
        public
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        return BitPackLib.packUint24(word, value, bitIndex);
    }

    function packUint32(bytes32 word, uint32 value, uint256 bitIndex)
        public
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        return BitPackLib.packUint32(word, value, bitIndex);
    }

    function packUint40(bytes32 word, uint40 value, uint256 bitIndex)
        public
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        return BitPackLib.packUint40(word, value, bitIndex);
    }

    function packUint48(bytes32 word, uint48 value, uint256 bitIndex)
        public
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        return BitPackLib.packUint48(word, value, bitIndex);
    }

    function packUint56(bytes32 word, uint56 value, uint256 bitIndex)
        public
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        return BitPackLib.packUint56(word, value, bitIndex);
    }

    function packUint64(bytes32 word, uint64 value, uint256 bitIndex)
        public
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        return BitPackLib.packUint64(word, value, bitIndex);
    }

    function packUint72(bytes32 word, uint72 value, uint256 bitIndex)
        public
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        return BitPackLib.packUint72(word, value, bitIndex);
    }

    function packUint80(bytes32 word, uint80 value, uint256 bitIndex)
        public
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        return BitPackLib.packUint80(word, value, bitIndex);
    }

    function packUint88(bytes32 word, uint88 value, uint256 bitIndex)
        public
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        return BitPackLib.packUint88(word, value, bitIndex);
    }

    function packUint96(bytes32 word, uint96 value, uint256 bitIndex)
        public
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        return BitPackLib.packUint96(word, value, bitIndex);
    }

    function packUint104(bytes32 word, uint104 value, uint256 bitIndex)
        public
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        return BitPackLib.packUint104(word, value, bitIndex);
    }

    function packUint112(bytes32 word, uint112 value, uint256 bitIndex)
        public
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        return BitPackLib.packUint112(word, value, bitIndex);
    }

    function packUint120(bytes32 word, uint120 value, uint256 bitIndex)
        public
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        return BitPackLib.packUint120(word, value, bitIndex);
    }

    function packUint128(bytes32 word, uint128 value, uint256 bitIndex)
        public
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        return BitPackLib.packUint128(word, value, bitIndex);
    }

    function packUint136(bytes32 word, uint136 value, uint256 bitIndex)
        public
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        return BitPackLib.packUint136(word, value, bitIndex);
    }

    function packUint144(bytes32 word, uint144 value, uint256 bitIndex)
        public
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        return BitPackLib.packUint144(word, value, bitIndex);
    }

    function packUint152(bytes32 word, uint152 value, uint256 bitIndex)
        public
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        return BitPackLib.packUint152(word, value, bitIndex);
    }

    function packUint160(bytes32 word, uint160 value, uint256 bitIndex)
        public
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        return BitPackLib.packUint160(word, value, bitIndex);
    }

    function packUint168(bytes32 word, uint168 value, uint256 bitIndex)
        public
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        return BitPackLib.packUint168(word, value, bitIndex);
    }

    function packUint176(bytes32 word, uint176 value, uint256 bitIndex)
        public
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        return BitPackLib.packUint176(word, value, bitIndex);
    }

    function packUint184(bytes32 word, uint184 value, uint256 bitIndex)
        public
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        return BitPackLib.packUint184(word, value, bitIndex);
    }

    function packUint192(bytes32 word, uint192 value, uint256 bitIndex)
        public
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        return BitPackLib.packUint192(word, value, bitIndex);
    }

    function packUint200(bytes32 word, uint200 value, uint256 bitIndex)
        public
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        return BitPackLib.packUint200(word, value, bitIndex);
    }

    function packUint208(bytes32 word, uint208 value, uint256 bitIndex)
        public
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        return BitPackLib.packUint208(word, value, bitIndex);
    }

    function packUint216(bytes32 word, uint216 value, uint256 bitIndex)
        public
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        return BitPackLib.packUint216(word, value, bitIndex);
    }

    function packUint224(bytes32 word, uint224 value, uint256 bitIndex)
        public
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        return BitPackLib.packUint224(word, value, bitIndex);
    }

    function packUint232(bytes32 word, uint232 value, uint256 bitIndex)
        public
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        return BitPackLib.packUint232(word, value, bitIndex);
    }

    function packUint240(bytes32 word, uint240 value, uint256 bitIndex)
        public
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        return BitPackLib.packUint240(word, value, bitIndex);
    }

    function packUint248(bytes32 word, uint248 value, uint256 bitIndex)
        public
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        return BitPackLib.packUint248(word, value, bitIndex);
    }

    function packInt8(bytes32 word, int8 value, uint256 bitIndex)
        public
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        return BitPackLib.packInt8(word, value, bitIndex);
    }

    function packInt16(bytes32 word, int16 value, uint256 bitIndex)
        public
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        return BitPackLib.packInt16(word, value, bitIndex);
    }

    function packInt24(bytes32 word, int24 value, uint256 bitIndex)
        public
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        return BitPackLib.packInt24(word, value, bitIndex);
    }

    function packInt32(bytes32 word, int32 value, uint256 bitIndex)
        public
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        return BitPackLib.packInt32(word, value, bitIndex);
    }

    function packInt40(bytes32 word, int40 value, uint256 bitIndex)
        public
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        return BitPackLib.packInt40(word, value, bitIndex);
    }

    function packInt48(bytes32 word, int48 value, uint256 bitIndex)
        public
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        return BitPackLib.packInt48(word, value, bitIndex);
    }

    function packInt56(bytes32 word, int56 value, uint256 bitIndex)
        public
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        return BitPackLib.packInt56(word, value, bitIndex);
    }

    function packInt64(bytes32 word, int64 value, uint256 bitIndex)
        public
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        return BitPackLib.packInt64(word, value, bitIndex);
    }

    function packInt72(bytes32 word, int72 value, uint256 bitIndex)
        public
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        return BitPackLib.packInt72(word, value, bitIndex);
    }

    function packInt80(bytes32 word, int80 value, uint256 bitIndex)
        public
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        return BitPackLib.packInt80(word, value, bitIndex);
    }

    function packInt88(bytes32 word, int88 value, uint256 bitIndex)
        public
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        return BitPackLib.packInt88(word, value, bitIndex);
    }

    function packInt96(bytes32 word, int96 value, uint256 bitIndex)
        public
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        return BitPackLib.packInt96(word, value, bitIndex);
    }

    function packInt104(bytes32 word, int104 value, uint256 bitIndex)
        public
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        return BitPackLib.packInt104(word, value, bitIndex);
    }

    function packInt112(bytes32 word, int112 value, uint256 bitIndex)
        public
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        return BitPackLib.packInt112(word, value, bitIndex);
    }

    function packInt120(bytes32 word, int120 value, uint256 bitIndex)
        public
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        return BitPackLib.packInt120(word, value, bitIndex);
    }

    function packInt128(bytes32 word, int128 value, uint256 bitIndex)
        public
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        return BitPackLib.packInt128(word, value, bitIndex);
    }

    function packInt136(bytes32 word, int136 value, uint256 bitIndex)
        public
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        return BitPackLib.packInt136(word, value, bitIndex);
    }

    function packInt144(bytes32 word, int144 value, uint256 bitIndex)
        public
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        return BitPackLib.packInt144(word, value, bitIndex);
    }

    function packInt152(bytes32 word, int152 value, uint256 bitIndex)
        public
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        return BitPackLib.packInt152(word, value, bitIndex);
    }

    function packInt160(bytes32 word, int160 value, uint256 bitIndex)
        public
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        return BitPackLib.packInt160(word, value, bitIndex);
    }

    function packInt168(bytes32 word, int168 value, uint256 bitIndex)
        public
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        return BitPackLib.packInt168(word, value, bitIndex);
    }

    function packInt176(bytes32 word, int176 value, uint256 bitIndex)
        public
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        return BitPackLib.packInt176(word, value, bitIndex);
    }

    function packInt184(bytes32 word, int184 value, uint256 bitIndex)
        public
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        return BitPackLib.packInt184(word, value, bitIndex);
    }

    function packInt192(bytes32 word, int192 value, uint256 bitIndex)
        public
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        return BitPackLib.packInt192(word, value, bitIndex);
    }

    function packInt200(bytes32 word, int200 value, uint256 bitIndex)
        public
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        return BitPackLib.packInt200(word, value, bitIndex);
    }

    function packInt208(bytes32 word, int208 value, uint256 bitIndex)
        public
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        return BitPackLib.packInt208(word, value, bitIndex);
    }

    function packInt216(bytes32 word, int216 value, uint256 bitIndex)
        public
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        return BitPackLib.packInt216(word, value, bitIndex);
    }

    function packInt224(bytes32 word, int224 value, uint256 bitIndex)
        public
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        return BitPackLib.packInt224(word, value, bitIndex);
    }

    function packInt232(bytes32 word, int232 value, uint256 bitIndex)
        public
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        return BitPackLib.packInt232(word, value, bitIndex);
    }

    function packInt240(bytes32 word, int240 value, uint256 bitIndex)
        public
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        return BitPackLib.packInt240(word, value, bitIndex);
    }

    function packInt248(bytes32 word, int248 value, uint256 bitIndex)
        public
        pure
        returns (bytes32 newWord, uint256 freeBitIndex)
    {
        return BitPackLib.packInt248(word, value, bitIndex);
    }

    // ============================================================
    //                       UNPACK METHODS
    // ============================================================

    function unpackBool(bytes32 word, uint256 bitIndex)
        public
        pure
        returns (bool value)
    {
        return BitPackLib.unpackBool(word, bitIndex);
    }

    function unpackAddress(bytes32 word, uint256 bitIndex)
        public
        pure
        returns (address value)
    {
        return BitPackLib.unpackAddress(word, bitIndex);
    }

    function unpackUint8(bytes32 word, uint256 bitIndex)
        public
        pure
        returns (uint8 value)
    {
        return BitPackLib.unpackUint8(word, bitIndex);
    }

    function unpackUint16(bytes32 word, uint256 bitIndex)
        public
        pure
        returns (uint16 value)
    {
        return BitPackLib.unpackUint16(word, bitIndex);
    }

    function unpackUint24(bytes32 word, uint256 bitIndex)
        public
        pure
        returns (uint24 value)
    {
        return BitPackLib.unpackUint24(word, bitIndex);
    }

    function unpackUint32(bytes32 word, uint256 bitIndex)
        public
        pure
        returns (uint32 value)
    {
        return BitPackLib.unpackUint32(word, bitIndex);
    }

    function unpackUint40(bytes32 word, uint256 bitIndex)
        public
        pure
        returns (uint40 value)
    {
        return BitPackLib.unpackUint40(word, bitIndex);
    }

    function unpackUint48(bytes32 word, uint256 bitIndex)
        public
        pure
        returns (uint48 value)
    {
        return BitPackLib.unpackUint48(word, bitIndex);
    }

    function unpackUint56(bytes32 word, uint256 bitIndex)
        public
        pure
        returns (uint56 value)
    {
        return BitPackLib.unpackUint56(word, bitIndex);
    }

    function unpackUint64(bytes32 word, uint256 bitIndex)
        public
        pure
        returns (uint64 value)
    {
        return BitPackLib.unpackUint64(word, bitIndex);
    }

    function unpackUint72(bytes32 word, uint256 bitIndex)
        public
        pure
        returns (uint72 value)
    {
        return BitPackLib.unpackUint72(word, bitIndex);
    }

    function unpackUint80(bytes32 word, uint256 bitIndex)
        public
        pure
        returns (uint80 value)
    {
        return BitPackLib.unpackUint80(word, bitIndex);
    }

    function unpackUint88(bytes32 word, uint256 bitIndex)
        public
        pure
        returns (uint88 value)
    {
        return BitPackLib.unpackUint88(word, bitIndex);
    }

    function unpackUint96(bytes32 word, uint256 bitIndex)
        public
        pure
        returns (uint96 value)
    {
        return BitPackLib.unpackUint96(word, bitIndex);
    }

    function unpackUint104(bytes32 word, uint256 bitIndex)
        public
        pure
        returns (uint104 value)
    {
        return BitPackLib.unpackUint104(word, bitIndex);
    }

    function unpackUint112(bytes32 word, uint256 bitIndex)
        public
        pure
        returns (uint112 value)
    {
        return BitPackLib.unpackUint112(word, bitIndex);
    }

    function unpackUint120(bytes32 word, uint256 bitIndex)
        public
        pure
        returns (uint120 value)
    {
        return BitPackLib.unpackUint120(word, bitIndex);
    }

    function unpackUint128(bytes32 word, uint256 bitIndex)
        public
        pure
        returns (uint128 value)
    {
        return BitPackLib.unpackUint128(word, bitIndex);
    }

    function unpackUint136(bytes32 word, uint256 bitIndex)
        public
        pure
        returns (uint136 value)
    {
        return BitPackLib.unpackUint136(word, bitIndex);
    }

    function unpackUint144(bytes32 word, uint256 bitIndex)
        public
        pure
        returns (uint144 value)
    {
        return BitPackLib.unpackUint144(word, bitIndex);
    }

    function unpackUint152(bytes32 word, uint256 bitIndex)
        public
        pure
        returns (uint152 value)
    {
        return BitPackLib.unpackUint152(word, bitIndex);
    }

    function unpackUint160(bytes32 word, uint256 bitIndex)
        public
        pure
        returns (uint160 value)
    {
        return BitPackLib.unpackUint160(word, bitIndex);
    }

    function unpackUint168(bytes32 word, uint256 bitIndex)
        public
        pure
        returns (uint168 value)
    {
        return BitPackLib.unpackUint168(word, bitIndex);
    }

    function unpackUint176(bytes32 word, uint256 bitIndex)
        public
        pure
        returns (uint176 value)
    {
        return BitPackLib.unpackUint176(word, bitIndex);
    }

    function unpackUint184(bytes32 word, uint256 bitIndex)
        public
        pure
        returns (uint184 value)
    {
        return BitPackLib.unpackUint184(word, bitIndex);
    }

    function unpackUint192(bytes32 word, uint256 bitIndex)
        public
        pure
        returns (uint192 value)
    {
        return BitPackLib.unpackUint192(word, bitIndex);
    }

    function unpackUint200(bytes32 word, uint256 bitIndex)
        public
        pure
        returns (uint200 value)
    {
        return BitPackLib.unpackUint200(word, bitIndex);
    }

    function unpackUint208(bytes32 word, uint256 bitIndex)
        public
        pure
        returns (uint208 value)
    {
        return BitPackLib.unpackUint208(word, bitIndex);
    }

    function unpackUint216(bytes32 word, uint256 bitIndex)
        public
        pure
        returns (uint216 value)
    {
        return BitPackLib.unpackUint216(word, bitIndex);
    }

    function unpackUint224(bytes32 word, uint256 bitIndex)
        public
        pure
        returns (uint224 value)
    {
        return BitPackLib.unpackUint224(word, bitIndex);
    }

    function unpackUint232(bytes32 word, uint256 bitIndex)
        public
        pure
        returns (uint232 value)
    {
        return BitPackLib.unpackUint232(word, bitIndex);
    }

    function unpackUint240(bytes32 word, uint256 bitIndex)
        public
        pure
        returns (uint240 value)
    {
        return BitPackLib.unpackUint240(word, bitIndex);
    }

    function unpackUint248(bytes32 word, uint256 bitIndex)
        public
        pure
        returns (uint248 value)
    {
        return BitPackLib.unpackUint248(word, bitIndex);
    }

    function unpackInt8(bytes32 word, uint256 bitIndex)
        public
        pure
        returns (int8 value)
    {
        return BitPackLib.unpackInt8(word, bitIndex);
    }

    function unpackInt16(bytes32 word, uint256 bitIndex)
        public
        pure
        returns (int16 value)
    {
        return BitPackLib.unpackInt16(word, bitIndex);
    }

    function unpackInt24(bytes32 word, uint256 bitIndex)
        public
        pure
        returns (int24 value)
    {
        return BitPackLib.unpackInt24(word, bitIndex);
    }

    function unpackInt32(bytes32 word, uint256 bitIndex)
        public
        pure
        returns (int32 value)
    {
        return BitPackLib.unpackInt32(word, bitIndex);
    }

    function unpackInt40(bytes32 word, uint256 bitIndex)
        public
        pure
        returns (int40 value)
    {
        return BitPackLib.unpackInt40(word, bitIndex);
    }

    function unpackInt48(bytes32 word, uint256 bitIndex)
        public
        pure
        returns (int48 value)
    {
        return BitPackLib.unpackInt48(word, bitIndex);
    }

    function unpackInt56(bytes32 word, uint256 bitIndex)
        public
        pure
        returns (int56 value)
    {
        return BitPackLib.unpackInt56(word, bitIndex);
    }

    function unpackInt64(bytes32 word, uint256 bitIndex)
        public
        pure
        returns (int64 value)
    {
        return BitPackLib.unpackInt64(word, bitIndex);
    }

    function unpackInt72(bytes32 word, uint256 bitIndex)
        public
        pure
        returns (int72 value)
    {
        return BitPackLib.unpackInt72(word, bitIndex);
    }

    function unpackInt80(bytes32 word, uint256 bitIndex)
        public
        pure
        returns (int80 value)
    {
        return BitPackLib.unpackInt80(word, bitIndex);
    }

    function unpackInt88(bytes32 word, uint256 bitIndex)
        public
        pure
        returns (int88 value)
    {
        return BitPackLib.unpackInt88(word, bitIndex);
    }

    function unpackInt96(bytes32 word, uint256 bitIndex)
        public
        pure
        returns (int96 value)
    {
        return BitPackLib.unpackInt96(word, bitIndex);
    }

    function unpackInt104(bytes32 word, uint256 bitIndex)
        public
        pure
        returns (int104 value)
    {
        return BitPackLib.unpackInt104(word, bitIndex);
    }

    function unpackInt112(bytes32 word, uint256 bitIndex)
        public
        pure
        returns (int112 value)
    {
        return BitPackLib.unpackInt112(word, bitIndex);
    }

    function unpackInt120(bytes32 word, uint256 bitIndex)
        public
        pure
        returns (int120 value)
    {
        return BitPackLib.unpackInt120(word, bitIndex);
    }

    function unpackInt128(bytes32 word, uint256 bitIndex)
        public
        pure
        returns (int128 value)
    {
        return BitPackLib.unpackInt128(word, bitIndex);
    }

    function unpackInt136(bytes32 word, uint256 bitIndex)
        public
        pure
        returns (int136 value)
    {
        return BitPackLib.unpackInt136(word, bitIndex);
    }

    function unpackInt144(bytes32 word, uint256 bitIndex)
        public
        pure
        returns (int144 value)
    {
        return BitPackLib.unpackInt144(word, bitIndex);
    }

    function unpackInt152(bytes32 word, uint256 bitIndex)
        public
        pure
        returns (int152 value)
    {
        return BitPackLib.unpackInt152(word, bitIndex);
    }

    function unpackInt160(bytes32 word, uint256 bitIndex)
        public
        pure
        returns (int160 value)
    {
        return BitPackLib.unpackInt160(word, bitIndex);
    }

    function unpackInt168(bytes32 word, uint256 bitIndex)
        public
        pure
        returns (int168 value)
    {
        return BitPackLib.unpackInt168(word, bitIndex);
    }

    function unpackInt176(bytes32 word, uint256 bitIndex)
        public
        pure
        returns (int176 value)
    {
        return BitPackLib.unpackInt176(word, bitIndex);
    }

    function unpackInt184(bytes32 word, uint256 bitIndex)
        public
        pure
        returns (int184 value)
    {
        return BitPackLib.unpackInt184(word, bitIndex);
    }

    function unpackInt192(bytes32 word, uint256 bitIndex)
        public
        pure
        returns (int192 value)
    {
        return BitPackLib.unpackInt192(word, bitIndex);
    }

    function unpackInt200(bytes32 word, uint256 bitIndex)
        public
        pure
        returns (int200 value)
    {
        return BitPackLib.unpackInt200(word, bitIndex);
    }

    function unpackInt208(bytes32 word, uint256 bitIndex)
        public
        pure
        returns (int208 value)
    {
        return BitPackLib.unpackInt208(word, bitIndex);
    }

    function unpackInt216(bytes32 word, uint256 bitIndex)
        public
        pure
        returns (int216 value)
    {
        return BitPackLib.unpackInt216(word, bitIndex);
    }

    function unpackInt224(bytes32 word, uint256 bitIndex)
        public
        pure
        returns (int224 value)
    {
        return BitPackLib.unpackInt224(word, bitIndex);
    }

    function unpackInt232(bytes32 word, uint256 bitIndex)
        public
        pure
        returns (int232 value)
    {
        return BitPackLib.unpackInt232(word, bitIndex);
    }

    function unpackInt240(bytes32 word, uint256 bitIndex)
        public
        pure
        returns (int240 value)
    {
        return BitPackLib.unpackInt240(word, bitIndex);
    }

    function unpackInt248(bytes32 word, uint256 bitIndex)
        public
        pure
        returns (int248 value)
    {
        return BitPackLib.unpackInt248(word, bitIndex);
    }
}
