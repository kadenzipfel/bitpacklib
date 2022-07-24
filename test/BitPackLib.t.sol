// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "./mock/BitPackLibMock.sol";

contract BitPackLibTest is Test {
    BitPackLibMock bpli;

    function setUp() public {
        bpli = new BitPackLibMock();
    }

    // ============================================================
    //                      PACK/UNPACK BOOL
    // ============================================================

    function testPackBool() public {
        (bytes32 newWord, uint256 freeBitIndex) =
            bpli.packBool(bytes32(0), true, 0);

        assertEq(
            newWord,
            0x8000000000000000000000000000000000000000000000000000000000000000
        );
        assertEq(freeBitIndex, 1);
    }

    function testUnpackBool() public {
        (bytes32 newWord,) = bpli.packBool(bytes32(0), true, 0);
        bool value = bpli.unpackBool(newWord, 0);
        assertEq(value, true);
    }

    function testPackUnpackBool(bool value, uint8 bitIndex) public {
        (bytes32 newWord,) = bpli.packBool(bytes32(0), value, bitIndex);
        bool newValue = bpli.unpackBool(newWord, bitIndex);
        assertEq(newValue, value);
    }

    // ============================================================
    //                     PACK/UNPACK ADDRESS
    // ============================================================

    function testPackAddress() public {
        (bytes32 newWord, uint256 freeBitIndex) = bpli.packAddress(
            bytes32(0), address(0xBEeFbeefbEefbeEFbeEfbEEfBEeFbeEfBeEfBeef), 0
        );

        assertEq(
            newWord,
            0xBEEFBEEFBEEFBEEFBEEFBEEFBEEFBEEFBEEFBEEF000000000000000000000000
        );
        assertEq(freeBitIndex, 160);
    }

    function testUnpackAddress() public {
        (bytes32 newWord,) = bpli.packAddress(
            bytes32(0), address(0xBEeFbeefbEefbeEFbeEfbEEfBEeFbeEfBeEfBeef), 0
        );
        address value = bpli.unpackAddress(newWord, 0);
        assertEq(value, address(0xBEeFbeefbEefbeEFbeEfbEEfBEeFbeEfBeEfBeef));
    }

    function testPackUnpackAddress(address value, uint8 bitIndex) public {
        vm.assume(bitIndex <= 96);
        (bytes32 newWord,) = bpli.packAddress(bytes32(0), value, bitIndex);
        address newValue = bpli.unpackAddress(newWord, bitIndex);
        assertEq(newValue, value);
    }

    // ============================================================
    //                       PACK/UNPACK UINT
    // ============================================================

    function testPackUint8() public {
        (bytes32 newWord, uint256 freeBitIndex) =
            bpli.packUint8(bytes32(0), uint8(0x69), 0);

        assertEq(
            newWord,
            0x6900000000000000000000000000000000000000000000000000000000000000
        );
        assertEq(freeBitIndex, 8);
    }

    function testUnpackUint8() public {
        (bytes32 newWord,) = bpli.packUint8(bytes32(0), uint8(0x69), 0);
        uint8 value = bpli.unpackUint8(newWord, 0);
        assertEq(value, uint8(0x69));
    }

    function testPackUnpackUint8(uint8 value, uint8 bitIndex) public {
        vm.assume(bitIndex <= 248);
        (bytes32 newWord,) = bpli.packUint8(bytes32(0), value, bitIndex);
        uint8 newValue = bpli.unpackUint8(newWord, bitIndex);
        assertEq(newValue, value);
    }

    function testPackUint16() public {
        (bytes32 newWord, uint256 freeBitIndex) =
            bpli.packUint16(bytes32(0), uint16(0x6969), 0);

        assertEq(
            newWord,
            0x6969000000000000000000000000000000000000000000000000000000000000
        );
        assertEq(freeBitIndex, 16);
    }

    function testUnpackUint16() public {
        (bytes32 newWord,) = bpli.packUint16(bytes32(0), uint16(0x6969), 0);
        uint16 value = bpli.unpackUint16(newWord, 0);
        assertEq(value, uint16(0x6969));
    }

    function testPackUnpackUint16(uint16 value, uint16 bitIndex) public {
        vm.assume(bitIndex <= 240);
        (bytes32 newWord,) = bpli.packUint16(bytes32(0), value, bitIndex);
        uint16 newValue = bpli.unpackUint16(newWord, bitIndex);
        assertEq(newValue, value);
    }

    function testPackUint24() public {
        (bytes32 newWord, uint256 freeBitIndex) =
            bpli.packUint24(bytes32(0), uint24(0x696969), 0);

        assertEq(
            newWord,
            0x6969690000000000000000000000000000000000000000000000000000000000
        );
        assertEq(freeBitIndex, 24);
    }

    function testUnpackUint24() public {
        (bytes32 newWord,) = bpli.packUint24(bytes32(0), uint24(0x696969), 0);
        uint24 value = bpli.unpackUint24(newWord, 0);
        assertEq(value, uint24(0x696969));
    }

    function testPackUnpackUint24(uint24 value, uint24 bitIndex) public {
        vm.assume(bitIndex <= 232);
        (bytes32 newWord,) = bpli.packUint24(bytes32(0), value, bitIndex);
        uint24 newValue = bpli.unpackUint24(newWord, bitIndex);
        assertEq(newValue, value);
    }

    function testPackUint32() public {
        (bytes32 newWord, uint256 freeBitIndex) =
            bpli.packUint32(bytes32(0), uint32(0x69696969), 0);

        assertEq(
            newWord,
            0x6969696900000000000000000000000000000000000000000000000000000000
        );
        assertEq(freeBitIndex, 32);
    }

    function testUnpackUint32() public {
        (bytes32 newWord,) = bpli.packUint32(bytes32(0), uint32(0x69696969), 0);
        uint32 value = bpli.unpackUint32(newWord, 0);
        assertEq(value, uint32(0x69696969));
    }

    function testPackUnpackUint32(uint32 value, uint32 bitIndex) public {
        vm.assume(bitIndex <= 224);
        (bytes32 newWord,) = bpli.packUint32(bytes32(0), value, bitIndex);
        uint32 newValue = bpli.unpackUint32(newWord, bitIndex);
        assertEq(newValue, value);
    }

    function testPackUint40() public {
        (bytes32 newWord, uint256 freeBitIndex) =
            bpli.packUint40(bytes32(0), uint40(0x6969696969), 0);

        assertEq(
            newWord,
            0x6969696969000000000000000000000000000000000000000000000000000000
        );
        assertEq(freeBitIndex, 40);
    }

    function testUnpackUint40() public {
        (bytes32 newWord,) =
            bpli.packUint40(bytes32(0), uint40(0x6969696969), 0);
        uint40 value = bpli.unpackUint40(newWord, 0);
        assertEq(value, uint40(0x6969696969));
    }

    function testPackUnpackUint40(uint40 value, uint40 bitIndex) public {
        vm.assume(bitIndex <= 216);
        (bytes32 newWord,) = bpli.packUint40(bytes32(0), value, bitIndex);
        uint40 newValue = bpli.unpackUint40(newWord, bitIndex);
        assertEq(newValue, value);
    }

    function testPackUint48() public {
        (bytes32 newWord, uint256 freeBitIndex) =
            bpli.packUint48(bytes32(0), uint48(0x696969696969), 0);

        assertEq(
            newWord,
            0x6969696969690000000000000000000000000000000000000000000000000000
        );
        assertEq(freeBitIndex, 48);
    }

    function testUnpackUint48() public {
        (bytes32 newWord,) =
            bpli.packUint48(bytes32(0), uint48(0x696969696969), 0);
        uint48 value = bpli.unpackUint48(newWord, 0);
        assertEq(value, uint48(0x696969696969));
    }

    function testPackUnpackUint48(uint48 value, uint48 bitIndex) public {
        vm.assume(bitIndex <= 208);
        (bytes32 newWord,) = bpli.packUint48(bytes32(0), value, bitIndex);
        uint48 newValue = bpli.unpackUint48(newWord, bitIndex);
        assertEq(newValue, value);
    }

    function testPackUint56() public {
        (bytes32 newWord, uint256 freeBitIndex) =
            bpli.packUint56(bytes32(0), uint56(0x69696969696969), 0);

        assertEq(
            newWord,
            0x6969696969696900000000000000000000000000000000000000000000000000
        );
        assertEq(freeBitIndex, 56);
    }

    function testUnpackUint56() public {
        (bytes32 newWord,) =
            bpli.packUint56(bytes32(0), uint56(0x69696969696969), 0);
        uint56 value = bpli.unpackUint56(newWord, 0);
        assertEq(value, uint56(0x69696969696969));
    }

    function testPackUnpackUint56(uint56 value, uint56 bitIndex) public {
        vm.assume(bitIndex <= 200);
        (bytes32 newWord,) = bpli.packUint56(bytes32(0), value, bitIndex);
        uint56 newValue = bpli.unpackUint56(newWord, bitIndex);
        assertEq(newValue, value);
    }

    function testPackUint64() public {
        (bytes32 newWord, uint256 freeBitIndex) =
            bpli.packUint64(bytes32(0), uint64(0x6969696969696969), 0);

        assertEq(
            newWord,
            0x6969696969696969000000000000000000000000000000000000000000000000
        );
        assertEq(freeBitIndex, 64);
    }

    function testUnpackUint64() public {
        (bytes32 newWord,) =
            bpli.packUint64(bytes32(0), uint64(0x6969696969696969), 0);
        uint64 value = bpli.unpackUint64(newWord, 0);
        assertEq(value, uint64(0x6969696969696969));
    }

    function testPackUnpackUint64(uint64 value, uint64 bitIndex) public {
        vm.assume(bitIndex <= 192);
        (bytes32 newWord,) = bpli.packUint64(bytes32(0), value, bitIndex);
        uint64 newValue = bpli.unpackUint64(newWord, bitIndex);
        assertEq(newValue, value);
    }

    function testPackUint72() public {
        (bytes32 newWord, uint256 freeBitIndex) =
            bpli.packUint72(bytes32(0), uint72(0x696969696969696969), 0);

        assertEq(
            newWord,
            0x6969696969696969690000000000000000000000000000000000000000000000
        );
        assertEq(freeBitIndex, 72);
    }

    function testUnpackUint72() public {
        (bytes32 newWord,) =
            bpli.packUint72(bytes32(0), uint72(0x696969696969696969), 0);
        uint72 value = bpli.unpackUint72(newWord, 0);
        assertEq(value, uint72(0x696969696969696969));
    }

    function testPackUnpackUint72(uint72 value, uint72 bitIndex) public {
        vm.assume(bitIndex <= 184);
        (bytes32 newWord,) = bpli.packUint72(bytes32(0), value, bitIndex);
        uint72 newValue = bpli.unpackUint72(newWord, bitIndex);
        assertEq(newValue, value);
    }

    function testPackUint80() public {
        (bytes32 newWord, uint256 freeBitIndex) =
            bpli.packUint80(bytes32(0), uint80(0x69696969696969696969), 0);

        assertEq(
            newWord,
            0x6969696969696969696900000000000000000000000000000000000000000000
        );
        assertEq(freeBitIndex, 80);
    }

    function testUnpackUint80() public {
        (bytes32 newWord,) =
            bpli.packUint80(bytes32(0), uint80(0x69696969696969696969), 0);
        uint80 value = bpli.unpackUint80(newWord, 0);
        assertEq(value, uint80(0x69696969696969696969));
    }

    function testPackUnpackUint80(uint80 value, uint80 bitIndex) public {
        vm.assume(bitIndex <= 176);
        (bytes32 newWord,) = bpli.packUint80(bytes32(0), value, bitIndex);
        uint80 newValue = bpli.unpackUint80(newWord, bitIndex);
        assertEq(newValue, value);
    }

    function testPackUint88() public {
        (bytes32 newWord, uint256 freeBitIndex) =
            bpli.packUint88(bytes32(0), uint88(0x6969696969696969696969), 0);

        assertEq(
            newWord,
            0x6969696969696969696969000000000000000000000000000000000000000000
        );
        assertEq(freeBitIndex, 88);
    }

    function testUnpackUint88() public {
        (bytes32 newWord,) =
            bpli.packUint88(bytes32(0), uint88(0x6969696969696969696969), 0);
        uint88 value = bpli.unpackUint88(newWord, 0);
        assertEq(value, uint88(0x6969696969696969696969));
    }

    function testPackUnpackUint88(uint88 value, uint88 bitIndex) public {
        vm.assume(bitIndex <= 168);
        (bytes32 newWord,) = bpli.packUint88(bytes32(0), value, bitIndex);
        uint88 newValue = bpli.unpackUint88(newWord, bitIndex);
        assertEq(newValue, value);
    }

    function testPackUint96() public {
        (bytes32 newWord, uint256 freeBitIndex) =
            bpli.packUint96(bytes32(0), uint96(0x696969696969696969696969), 0);

        assertEq(
            newWord,
            0x6969696969696969696969690000000000000000000000000000000000000000
        );
        assertEq(freeBitIndex, 96);
    }

    function testUnpackUint96() public {
        (bytes32 newWord,) =
            bpli.packUint96(bytes32(0), uint96(0x696969696969696969696969), 0);
        uint96 value = bpli.unpackUint96(newWord, 0);
        assertEq(value, uint96(0x696969696969696969696969));
    }

    function testPackUnpackUint96(uint96 value, uint96 bitIndex) public {
        vm.assume(bitIndex <= 160);
        (bytes32 newWord,) = bpli.packUint96(bytes32(0), value, bitIndex);
        uint96 newValue = bpli.unpackUint96(newWord, bitIndex);
        assertEq(newValue, value);
    }

    function testPackUint104() public {
        (bytes32 newWord, uint256 freeBitIndex) =
            bpli.packUint104(bytes32(0), uint104(0x69696969696969696969696969), 0);

        assertEq(
            newWord,
            0x6969696969696969696969696900000000000000000000000000000000000000
        );
        assertEq(freeBitIndex, 104);
    }

    function testUnpackUint104() public {
        (bytes32 newWord,) =
            bpli.packUint104(bytes32(0), uint104(0x69696969696969696969696969), 0);
        uint104 value = bpli.unpackUint104(newWord, 0);
        assertEq(value, uint104(0x69696969696969696969696969));
    }

    function testPackUnpackUint104(uint104 value, uint104 bitIndex) public {
        vm.assume(bitIndex <= 152);
        (bytes32 newWord,) = bpli.packUint104(bytes32(0), value, bitIndex);
        uint104 newValue = bpli.unpackUint104(newWord, bitIndex);
        assertEq(newValue, value);
    }

    function testPackUint112() public {
        (bytes32 newWord, uint256 freeBitIndex) =
            bpli.packUint112(bytes32(0), uint112(0x6969696969696969696969696969), 0);

        assertEq(
            newWord,
            0x6969696969696969696969696969000000000000000000000000000000000000
        );
        assertEq(freeBitIndex, 112);
    }

    function testUnpackUint112() public {
        (bytes32 newWord,) =
            bpli.packUint112(bytes32(0), uint112(0x6969696969696969696969696969), 0);
        uint112 value = bpli.unpackUint112(newWord, 0);
        assertEq(value, uint112(0x6969696969696969696969696969));
    }

    function testPackUnpackUint112(uint112 value, uint112 bitIndex) public {
        vm.assume(bitIndex <= 144);
        (bytes32 newWord,) = bpli.packUint112(bytes32(0), value, bitIndex);
        uint112 newValue = bpli.unpackUint112(newWord, bitIndex);
        assertEq(newValue, value);
    }

    function testPackUint120() public {
        (bytes32 newWord, uint256 freeBitIndex) = bpli.packUint120(
            bytes32(0), uint120(0x696969696969696969696969696969), 0
        );

        assertEq(
            newWord,
            0x6969696969696969696969696969690000000000000000000000000000000000
        );
        assertEq(freeBitIndex, 120);
    }

    function testUnpackUint120() public {
        (bytes32 newWord,) = bpli.packUint120(
            bytes32(0), uint120(0x696969696969696969696969696969), 0
        );
        uint120 value = bpli.unpackUint120(newWord, 0);
        assertEq(value, uint120(0x696969696969696969696969696969));
    }

    function testPackUnpackUint120(uint120 value, uint120 bitIndex) public {
        vm.assume(bitIndex <= 136);
        (bytes32 newWord,) = bpli.packUint120(bytes32(0), value, bitIndex);
        uint120 newValue = bpli.unpackUint120(newWord, bitIndex);
        assertEq(newValue, value);
    }

    function testPackUint128() public {
        (bytes32 newWord, uint256 freeBitIndex) = bpli.packUint128(
            bytes32(0), uint128(0x69696969696969696969696969696969), 0
        );

        assertEq(
            newWord,
            0x6969696969696969696969696969696900000000000000000000000000000000
        );
        assertEq(freeBitIndex, 128);
    }

    function testUnpackUint128() public {
        (bytes32 newWord,) = bpli.packUint128(
            bytes32(0), uint128(0x69696969696969696969696969696969), 0
        );
        uint128 value = bpli.unpackUint128(newWord, 0);
        assertEq(value, uint128(0x69696969696969696969696969696969));
    }

    function testPackUnpackUint128(uint128 value, uint128 bitIndex) public {
        vm.assume(bitIndex <= 128);
        (bytes32 newWord,) = bpli.packUint128(bytes32(0), value, bitIndex);
        uint128 newValue = bpli.unpackUint128(newWord, bitIndex);
        assertEq(newValue, value);
    }

    function testPackUint136() public {
        (bytes32 newWord, uint256 freeBitIndex) = bpli.packUint136(
            bytes32(0), uint136(0x6969696969696969696969696969696969), 0
        );

        assertEq(
            newWord,
            0x6969696969696969696969696969696969000000000000000000000000000000
        );
        assertEq(freeBitIndex, 136);
    }

    function testUnpackUint136() public {
        (bytes32 newWord,) = bpli.packUint136(
            bytes32(0), uint136(0x6969696969696969696969696969696969), 0
        );
        uint136 value = bpli.unpackUint136(newWord, 0);
        assertEq(value, uint136(0x6969696969696969696969696969696969));
    }

    function testPackUnpackUint136(uint136 value, uint136 bitIndex) public {
        vm.assume(bitIndex <= 120);
        (bytes32 newWord,) = bpli.packUint136(bytes32(0), value, bitIndex);
        uint136 newValue = bpli.unpackUint136(newWord, bitIndex);
        assertEq(newValue, value);
    }

    function testPackUint144() public {
        (bytes32 newWord, uint256 freeBitIndex) = bpli.packUint144(
            bytes32(0), uint144(0x696969696969696969696969696969696969), 0
        );

        assertEq(
            newWord,
            0x6969696969696969696969696969696969690000000000000000000000000000
        );
        assertEq(freeBitIndex, 144);
    }

    function testUnpackUint144() public {
        (bytes32 newWord,) = bpli.packUint144(
            bytes32(0), uint144(0x696969696969696969696969696969696969), 0
        );
        uint144 value = bpli.unpackUint144(newWord, 0);
        assertEq(value, uint144(0x696969696969696969696969696969696969));
    }

    function testPackUnpackUint144(uint144 value, uint144 bitIndex) public {
        vm.assume(bitIndex <= 112);
        (bytes32 newWord,) = bpli.packUint144(bytes32(0), value, bitIndex);
        uint144 newValue = bpli.unpackUint144(newWord, bitIndex);
        assertEq(newValue, value);
    }

    function testPackUint152() public {
        (bytes32 newWord, uint256 freeBitIndex) = bpli.packUint152(
            bytes32(0), uint152(0x69696969696969696969696969696969696969), 0
        );

        assertEq(
            newWord,
            0x6969696969696969696969696969696969696900000000000000000000000000
        );
        assertEq(freeBitIndex, 152);
    }

    function testUnpackUint152() public {
        (bytes32 newWord,) = bpli.packUint152(
            bytes32(0), uint152(0x69696969696969696969696969696969696969), 0
        );
        uint152 value = bpli.unpackUint152(newWord, 0);
        assertEq(value, uint152(0x69696969696969696969696969696969696969));
    }

    function testPackUnpackUint152(uint152 value, uint152 bitIndex) public {
        vm.assume(bitIndex <= 104);
        (bytes32 newWord,) = bpli.packUint152(bytes32(0), value, bitIndex);
        uint152 newValue = bpli.unpackUint152(newWord, bitIndex);
        assertEq(newValue, value);
    }

    function testPackUint160() public {
        (bytes32 newWord, uint256 freeBitIndex) = bpli.packUint160(
            bytes32(0), uint160(0x6969696969696969696969696969696969696969), 0
        );

        assertEq(
            newWord,
            0x6969696969696969696969696969696969696969000000000000000000000000
        );
        assertEq(freeBitIndex, 160);
    }

    function testUnpackUint160() public {
        (bytes32 newWord,) = bpli.packUint160(
            bytes32(0), uint160(0x6969696969696969696969696969696969696969), 0
        );
        uint160 value = bpli.unpackUint160(newWord, 0);
        assertEq(value, uint160(0x6969696969696969696969696969696969696969));
    }

    function testPackUnpackUint160(uint160 value, uint160 bitIndex) public {
        vm.assume(bitIndex <= 96);
        (bytes32 newWord,) = bpli.packUint160(bytes32(0), value, bitIndex);
        uint160 newValue = bpli.unpackUint160(newWord, bitIndex);
        assertEq(newValue, value);
    }

    function testPackUint168() public {
        (bytes32 newWord, uint256 freeBitIndex) = bpli.packUint168(
            bytes32(0), uint168(0x696969696969696969696969696969696969696969), 0
        );

        assertEq(
            newWord,
            0x6969696969696969696969696969696969696969690000000000000000000000
        );
        assertEq(freeBitIndex, 168);
    }

    function testUnpackUint168() public {
        (bytes32 newWord,) = bpli.packUint168(
            bytes32(0), uint168(0x696969696969696969696969696969696969696969), 0
        );
        uint168 value = bpli.unpackUint168(newWord, 0);
        assertEq(value, uint168(0x696969696969696969696969696969696969696969));
    }

    function testPackUnpackUint168(uint168 value, uint168 bitIndex) public {
        vm.assume(bitIndex <= 88);
        (bytes32 newWord,) = bpli.packUint168(bytes32(0), value, bitIndex);
        uint168 newValue = bpli.unpackUint168(newWord, bitIndex);
        assertEq(newValue, value);
    }

    function testPackUint176() public {
        (bytes32 newWord, uint256 freeBitIndex) = bpli.packUint176(
            bytes32(0), uint176(0x69696969696969696969696969696969696969696969), 0
        );

        assertEq(
            newWord,
            0x6969696969696969696969696969696969696969696900000000000000000000
        );
        assertEq(freeBitIndex, 176);
    }

    function testUnpackUint176() public {
        (bytes32 newWord,) = bpli.packUint176(
            bytes32(0), uint176(0x69696969696969696969696969696969696969696969), 0
        );
        uint176 value = bpli.unpackUint176(newWord, 0);
        assertEq(value, uint176(0x69696969696969696969696969696969696969696969));
    }

    function testPackUnpackUint176(uint176 value, uint176 bitIndex) public {
        vm.assume(bitIndex <= 80);
        (bytes32 newWord,) = bpli.packUint176(bytes32(0), value, bitIndex);
        uint176 newValue = bpli.unpackUint176(newWord, bitIndex);
        assertEq(newValue, value);
    }

    function testPackUint184() public {
        (bytes32 newWord, uint256 freeBitIndex) = bpli.packUint184(
            bytes32(0), uint184(0x6969696969696969696969696969696969696969696969), 0
        );

        assertEq(
            newWord,
            0x6969696969696969696969696969696969696969696969000000000000000000
        );
        assertEq(freeBitIndex, 184);
    }

    function testUnpackUint184() public {
        (bytes32 newWord,) = bpli.packUint184(
            bytes32(0), uint184(0x6969696969696969696969696969696969696969696969), 0
        );
        uint184 value = bpli.unpackUint184(newWord, 0);
        assertEq(
            value, uint184(0x6969696969696969696969696969696969696969696969)
        );
    }

    function testPackUnpackUint184(uint184 value, uint184 bitIndex) public {
        vm.assume(bitIndex <= 72);
        (bytes32 newWord,) = bpli.packUint184(bytes32(0), value, bitIndex);
        uint184 newValue = bpli.unpackUint184(newWord, bitIndex);
        assertEq(newValue, value);
    }

    function testPackUint192() public {
        (bytes32 newWord, uint256 freeBitIndex) = bpli.packUint192(
            bytes32(0),
            uint192(0x696969696969696969696969696969696969696969696969),
            0
        );

        assertEq(
            newWord,
            0x6969696969696969696969696969696969696969696969690000000000000000
        );
        assertEq(freeBitIndex, 192);
    }

    function testUnpackUint192() public {
        (bytes32 newWord,) = bpli.packUint192(
            bytes32(0),
            uint192(0x696969696969696969696969696969696969696969696969),
            0
        );
        uint192 value = bpli.unpackUint192(newWord, 0);
        assertEq(
            value, uint192(0x696969696969696969696969696969696969696969696969)
        );
    }

    function testPackUnpackUint192(uint192 value, uint192 bitIndex) public {
        vm.assume(bitIndex <= 64);
        (bytes32 newWord,) = bpli.packUint192(bytes32(0), value, bitIndex);
        uint192 newValue = bpli.unpackUint192(newWord, bitIndex);
        assertEq(newValue, value);
    }

    function testPackUint200() public {
        (bytes32 newWord, uint256 freeBitIndex) = bpli.packUint200(
            bytes32(0),
            uint200(0x69696969696969696969696969696969696969696969696969),
            0
        );

        assertEq(
            newWord,
            0x6969696969696969696969696969696969696969696969696900000000000000
        );
        assertEq(freeBitIndex, 200);
    }

    function testUnpackUint200() public {
        (bytes32 newWord,) = bpli.packUint200(
            bytes32(0),
            uint200(0x69696969696969696969696969696969696969696969696969),
            0
        );
        uint200 value = bpli.unpackUint200(newWord, 0);
        assertEq(
            value, uint200(0x69696969696969696969696969696969696969696969696969)
        );
    }

    function testPackUnpackUint200(uint200 value, uint200 bitIndex) public {
        vm.assume(bitIndex <= 56);
        (bytes32 newWord,) = bpli.packUint200(bytes32(0), value, bitIndex);
        uint200 newValue = bpli.unpackUint200(newWord, bitIndex);
        assertEq(newValue, value);
    }

    function testPackUint208() public {
        (bytes32 newWord, uint256 freeBitIndex) = bpli.packUint208(
            bytes32(0),
            uint208(0x6969696969696969696969696969696969696969696969696969),
            0
        );

        assertEq(
            newWord,
            0x6969696969696969696969696969696969696969696969696969000000000000
        );
        assertEq(freeBitIndex, 208);
    }

    function testUnpackUint208() public {
        (bytes32 newWord,) = bpli.packUint208(
            bytes32(0),
            uint208(0x6969696969696969696969696969696969696969696969696969),
            0
        );
        uint208 value = bpli.unpackUint208(newWord, 0);
        assertEq(
            value, uint208(0x6969696969696969696969696969696969696969696969696969)
        );
    }

    function testPackUnpackUint208(uint208 value, uint208 bitIndex) public {
        vm.assume(bitIndex <= 48);
        (bytes32 newWord,) = bpli.packUint208(bytes32(0), value, bitIndex);
        uint208 newValue = bpli.unpackUint208(newWord, bitIndex);
        assertEq(newValue, value);
    }

    function testPackUint216() public {
        (bytes32 newWord, uint256 freeBitIndex) = bpli.packUint216(
            bytes32(0),
            uint216(0x696969696969696969696969696969696969696969696969696969),
            0
        );

        assertEq(
            newWord,
            0x6969696969696969696969696969696969696969696969696969690000000000
        );
        assertEq(freeBitIndex, 216);
    }

    function testUnpackUint216() public {
        (bytes32 newWord,) = bpli.packUint216(
            bytes32(0),
            uint216(0x696969696969696969696969696969696969696969696969696969),
            0
        );
        uint216 value = bpli.unpackUint216(newWord, 0);
        assertEq(
            value, uint216(0x696969696969696969696969696969696969696969696969696969)
        );
    }

    function testPackUnpackUint216(uint216 value, uint216 bitIndex) public {
        vm.assume(bitIndex <= 40);
        (bytes32 newWord,) = bpli.packUint216(bytes32(0), value, bitIndex);
        uint216 newValue = bpli.unpackUint216(newWord, bitIndex);
        assertEq(newValue, value);
    }

    function testPackUint224() public {
        (bytes32 newWord, uint256 freeBitIndex) = bpli.packUint224(
            bytes32(0),
            uint224(0x69696969696969696969696969696969696969696969696969696969),
            0
        );

        assertEq(
            newWord,
            0x6969696969696969696969696969696969696969696969696969696900000000
        );
        assertEq(freeBitIndex, 224);
    }

    function testUnpackUint224() public {
        (bytes32 newWord,) = bpli.packUint224(
            bytes32(0),
            uint224(0x69696969696969696969696969696969696969696969696969696969),
            0
        );
        uint224 value = bpli.unpackUint224(newWord, 0);
        assertEq(
            value,
            uint224(0x69696969696969696969696969696969696969696969696969696969)
        );
    }

    function testPackUnpackUint224(uint224 value, uint224 bitIndex) public {
        vm.assume(bitIndex <= 32);
        (bytes32 newWord,) = bpli.packUint224(bytes32(0), value, bitIndex);
        uint224 newValue = bpli.unpackUint224(newWord, bitIndex);
        assertEq(newValue, value);
    }

    function testPackUint232() public {
        (bytes32 newWord, uint256 freeBitIndex) = bpli.packUint232(
            bytes32(0),
            uint232(0x6969696969696969696969696969696969696969696969696969696969),
            0
        );

        assertEq(
            newWord,
            0x6969696969696969696969696969696969696969696969696969696969000000
        );
        assertEq(freeBitIndex, 232);
    }

    function testUnpackUint232() public {
        (bytes32 newWord,) = bpli.packUint232(
            bytes32(0),
            uint232(0x6969696969696969696969696969696969696969696969696969696969),
            0
        );
        uint232 value = bpli.unpackUint232(newWord, 0);
        assertEq(
            value,
            uint232(0x6969696969696969696969696969696969696969696969696969696969)
        );
    }

    function testPackUnpackUint232(uint232 value, uint232 bitIndex) public {
        vm.assume(bitIndex <= 24);
        (bytes32 newWord,) = bpli.packUint232(bytes32(0), value, bitIndex);
        uint232 newValue = bpli.unpackUint232(newWord, bitIndex);
        assertEq(newValue, value);
    }

    function testPackUint240() public {
        (bytes32 newWord, uint256 freeBitIndex) = bpli.packUint240(
            bytes32(0),
            uint240(0x696969696969696969696969696969696969696969696969696969696969),
            0
        );

        assertEq(
            newWord,
            0x6969696969696969696969696969696969696969696969696969696969690000
        );
        assertEq(freeBitIndex, 240);
    }

    function testUnpackUint240() public {
        (bytes32 newWord,) = bpli.packUint240(
            bytes32(0),
            uint240(0x696969696969696969696969696969696969696969696969696969696969),
            0
        );
        uint240 value = bpli.unpackUint240(newWord, 0);
        assertEq(
            value,
            uint240(0x696969696969696969696969696969696969696969696969696969696969)
        );
    }

    function testPackUnpackUint240(uint240 value, uint240 bitIndex) public {
        vm.assume(bitIndex <= 16);
        (bytes32 newWord,) = bpli.packUint240(bytes32(0), value, bitIndex);
        uint240 newValue = bpli.unpackUint240(newWord, bitIndex);
        assertEq(newValue, value);
    }

    function testPackUint248() public {
        (bytes32 newWord, uint256 freeBitIndex) = bpli.packUint248(
            bytes32(0),
            uint248(0x69696969696969696969696969696969696969696969696969696969696969),
            0
        );

        assertEq(
            newWord,
            0x6969696969696969696969696969696969696969696969696969696969696900
        );
        assertEq(freeBitIndex, 248);
    }

    function testUnpackUint248() public {
        (bytes32 newWord,) = bpli.packUint248(
            bytes32(0),
            uint248(0x69696969696969696969696969696969696969696969696969696969696969),
            0
        );
        uint248 value = bpli.unpackUint248(newWord, 0);
        assertEq(
            value,
            uint248(0x69696969696969696969696969696969696969696969696969696969696969)
        );
    }

    function testPackUnpackUint248(uint248 value, uint248 bitIndex) public {
        vm.assume(bitIndex <= 8);
        (bytes32 newWord,) = bpli.packUint248(bytes32(0), value, bitIndex);
        uint248 newValue = bpli.unpackUint248(newWord, bitIndex);
        assertEq(newValue, value);
    }

    // ============================================================
    //                       PACK/UNPACK INT
    // ============================================================

    function testPackInt8() public {
        (bytes32 newWord, uint256 freeBitIndex) =
            bpli.packInt8(bytes32(0), int8(0x69), 0);

        assertEq(
            newWord,
            0x6900000000000000000000000000000000000000000000000000000000000000
        );
        assertEq(freeBitIndex, 8);
    }

    function testUnpackInt8() public {
        (bytes32 newWord,) = bpli.packInt8(bytes32(0), int8(0x69), 0);
        int8 value = bpli.unpackInt8(newWord, 0);
        assertEq(value, int8(0x69));
    }

    function testPackUnpackInt8(int8 value, uint8 bitIndex) public {
        vm.assume(bitIndex <= 248);
        (bytes32 newWord,) = bpli.packInt8(bytes32(0), value, bitIndex);
        int8 newValue = bpli.unpackInt8(newWord, bitIndex);
        assertEq(newValue, value);
    }

    function testPackInt16() public {
        (bytes32 newWord, uint256 freeBitIndex) =
            bpli.packInt16(bytes32(0), int16(0x6969), 0);

        assertEq(
            newWord,
            0x6969000000000000000000000000000000000000000000000000000000000000
        );
        assertEq(freeBitIndex, 16);
    }

    function testUnpackInt16() public {
        (bytes32 newWord,) = bpli.packInt16(bytes32(0), int16(0x6969), 0);
        int16 value = bpli.unpackInt16(newWord, 0);
        assertEq(value, int16(0x6969));
    }

    function testPackUnpackInt16(int16 value, uint8 bitIndex) public {
        vm.assume(bitIndex <= 240);
        (bytes32 newWord,) = bpli.packInt16(bytes32(0), value, bitIndex);
        int16 newValue = bpli.unpackInt16(newWord, bitIndex);
        assertEq(newValue, value);
    }

    function testPackInt24() public {
        (bytes32 newWord, uint256 freeBitIndex) =
            bpli.packInt24(bytes32(0), int24(0x696969), 0);

        assertEq(
            newWord,
            0x6969690000000000000000000000000000000000000000000000000000000000
        );
        assertEq(freeBitIndex, 24);
    }

    function testUnpackInt24() public {
        (bytes32 newWord,) = bpli.packInt24(bytes32(0), int24(0x696969), 0);
        int24 value = bpli.unpackInt24(newWord, 0);
        assertEq(value, int24(0x696969));
    }

    function testPackUnpackInt24(int24 value, uint8 bitIndex) public {
        vm.assume(bitIndex <= 232);
        (bytes32 newWord,) = bpli.packInt24(bytes32(0), value, bitIndex);
        int24 newValue = bpli.unpackInt24(newWord, bitIndex);
        assertEq(newValue, value);
    }

    function testPackInt32() public {
        (bytes32 newWord, uint256 freeBitIndex) =
            bpli.packInt32(bytes32(0), int32(0x69696969), 0);

        assertEq(
            newWord,
            0x6969696900000000000000000000000000000000000000000000000000000000
        );
        assertEq(freeBitIndex, 32);
    }

    function testUnpackInt32() public {
        (bytes32 newWord,) = bpli.packInt32(bytes32(0), int32(0x69696969), 0);
        int32 value = bpli.unpackInt32(newWord, 0);
        assertEq(value, int32(0x69696969));
    }

    function testPackUnpackInt32(int32 value, uint8 bitIndex) public {
        vm.assume(bitIndex <= 224);
        (bytes32 newWord,) = bpli.packInt32(bytes32(0), value, bitIndex);
        int32 newValue = bpli.unpackInt32(newWord, bitIndex);
        assertEq(newValue, value);
    }

    function testPackInt40() public {
        (bytes32 newWord, uint256 freeBitIndex) =
            bpli.packInt40(bytes32(0), int40(0x6969696969), 0);

        assertEq(
            newWord,
            0x6969696969000000000000000000000000000000000000000000000000000000
        );
        assertEq(freeBitIndex, 40);
    }

    function testUnpackInt40() public {
        (bytes32 newWord,) = bpli.packInt40(bytes32(0), int40(0x6969696969), 0);
        int40 value = bpli.unpackInt40(newWord, 0);
        assertEq(value, int40(0x6969696969));
    }

    function testPackUnpackInt40(int40 value, uint8 bitIndex) public {
        vm.assume(bitIndex <= 216);
        (bytes32 newWord,) = bpli.packInt40(bytes32(0), value, bitIndex);
        int40 newValue = bpli.unpackInt40(newWord, bitIndex);
        assertEq(newValue, value);
    }

    function testPackInt48() public {
        (bytes32 newWord, uint256 freeBitIndex) =
            bpli.packInt48(bytes32(0), int48(0x696969696969), 0);

        assertEq(
            newWord,
            0x6969696969690000000000000000000000000000000000000000000000000000
        );
        assertEq(freeBitIndex, 48);
    }

    function testUnpackInt48() public {
        (bytes32 newWord,) =
            bpli.packInt48(bytes32(0), int48(0x696969696969), 0);
        int48 value = bpli.unpackInt48(newWord, 0);
        assertEq(value, int48(0x696969696969));
    }

    function testPackUnpackInt48(int48 value, uint8 bitIndex) public {
        vm.assume(bitIndex <= 208);
        (bytes32 newWord,) = bpli.packInt48(bytes32(0), value, bitIndex);
        int48 newValue = bpli.unpackInt48(newWord, bitIndex);
        assertEq(newValue, value);
    }

    function testPackInt56() public {
        (bytes32 newWord, uint256 freeBitIndex) =
            bpli.packInt56(bytes32(0), int56(0x69696969696969), 0);

        assertEq(
            newWord,
            0x6969696969696900000000000000000000000000000000000000000000000000
        );
        assertEq(freeBitIndex, 56);
    }

    function testUnpackInt56() public {
        (bytes32 newWord,) =
            bpli.packInt56(bytes32(0), int56(0x69696969696969), 0);
        int56 value = bpli.unpackInt56(newWord, 0);
        assertEq(value, int56(0x69696969696969));
    }

    function testPackUnpackInt56(int56 value, uint8 bitIndex) public {
        vm.assume(bitIndex <= 200);
        (bytes32 newWord,) = bpli.packInt56(bytes32(0), value, bitIndex);
        int56 newValue = bpli.unpackInt56(newWord, bitIndex);
        assertEq(newValue, value);
    }

    function testPackInt64() public {
        (bytes32 newWord, uint256 freeBitIndex) =
            bpli.packInt64(bytes32(0), int64(0x6969696969696969), 0);

        assertEq(
            newWord,
            0x6969696969696969000000000000000000000000000000000000000000000000
        );
        assertEq(freeBitIndex, 64);
    }

    function testUnpackInt64() public {
        (bytes32 newWord,) =
            bpli.packInt64(bytes32(0), int64(0x6969696969696969), 0);
        int64 value = bpli.unpackInt64(newWord, 0);
        assertEq(value, int64(0x6969696969696969));
    }

    function testPackUnpackInt64(int64 value, uint8 bitIndex) public {
        vm.assume(bitIndex <= 192);
        (bytes32 newWord,) = bpli.packInt64(bytes32(0), value, bitIndex);
        int64 newValue = bpli.unpackInt64(newWord, bitIndex);
        assertEq(newValue, value);
    }

    function testPackInt72() public {
        (bytes32 newWord, uint256 freeBitIndex) =
            bpli.packInt72(bytes32(0), int72(0x696969696969696969), 0);

        assertEq(
            newWord,
            0x6969696969696969690000000000000000000000000000000000000000000000
        );
        assertEq(freeBitIndex, 72);
    }

    function testUnpackInt72() public {
        (bytes32 newWord,) =
            bpli.packInt72(bytes32(0), int72(0x696969696969696969), 0);
        int72 value = bpli.unpackInt72(newWord, 0);
        assertEq(value, int72(0x696969696969696969));
    }

    function testPackUnpackInt72(int72 value, uint8 bitIndex) public {
        vm.assume(bitIndex <= 184);
        (bytes32 newWord,) = bpli.packInt72(bytes32(0), value, bitIndex);
        int72 newValue = bpli.unpackInt72(newWord, bitIndex);
        assertEq(newValue, value);
    }

    function testPackInt80() public {
        (bytes32 newWord, uint256 freeBitIndex) =
            bpli.packInt80(bytes32(0), int80(0x69696969696969696969), 0);

        assertEq(
            newWord,
            0x6969696969696969696900000000000000000000000000000000000000000000
        );
        assertEq(freeBitIndex, 80);
    }

    function testUnpackInt80() public {
        (bytes32 newWord,) =
            bpli.packInt80(bytes32(0), int80(0x69696969696969696969), 0);
        int80 value = bpli.unpackInt80(newWord, 0);
        assertEq(value, int80(0x69696969696969696969));
    }

    function testPackUnpackInt80(int80 value, uint8 bitIndex) public {
        vm.assume(bitIndex <= 176);
        (bytes32 newWord,) = bpli.packInt80(bytes32(0), value, bitIndex);
        int80 newValue = bpli.unpackInt80(newWord, bitIndex);
        assertEq(newValue, value);
    }

    function testPackInt88() public {
        (bytes32 newWord, uint256 freeBitIndex) =
            bpli.packInt88(bytes32(0), int88(0x6969696969696969696969), 0);

        assertEq(
            newWord,
            0x6969696969696969696969000000000000000000000000000000000000000000
        );
        assertEq(freeBitIndex, 88);
    }

    function testUnpackInt88() public {
        (bytes32 newWord,) =
            bpli.packInt88(bytes32(0), int88(0x6969696969696969696969), 0);
        int88 value = bpli.unpackInt88(newWord, 0);
        assertEq(value, int88(0x6969696969696969696969));
    }

    function testPackUnpackInt88(int88 value, uint8 bitIndex) public {
        vm.assume(bitIndex <= 168);
        (bytes32 newWord,) = bpli.packInt88(bytes32(0), value, bitIndex);
        int88 newValue = bpli.unpackInt88(newWord, bitIndex);
        assertEq(newValue, value);
    }

    function testPackInt96() public {
        (bytes32 newWord, uint256 freeBitIndex) =
            bpli.packInt96(bytes32(0), int96(0x696969696969696969696969), 0);

        assertEq(
            newWord,
            0x6969696969696969696969690000000000000000000000000000000000000000
        );
        assertEq(freeBitIndex, 96);
    }

    function testUnpackInt96() public {
        (bytes32 newWord,) =
            bpli.packInt96(bytes32(0), int96(0x696969696969696969696969), 0);
        int96 value = bpli.unpackInt96(newWord, 0);
        assertEq(value, int96(0x696969696969696969696969));
    }

    function testPackUnpackInt96(int96 value, uint8 bitIndex) public {
        vm.assume(bitIndex <= 160);
        (bytes32 newWord,) = bpli.packInt96(bytes32(0), value, bitIndex);
        int96 newValue = bpli.unpackInt96(newWord, bitIndex);
        assertEq(newValue, value);
    }

    function testPackInt104() public {
        (bytes32 newWord, uint256 freeBitIndex) =
            bpli.packInt104(bytes32(0), int104(0x69696969696969696969696969), 0);

        assertEq(
            newWord,
            0x6969696969696969696969696900000000000000000000000000000000000000
        );
        assertEq(freeBitIndex, 104);
    }

    function testUnpackInt104() public {
        (bytes32 newWord,) =
            bpli.packInt104(bytes32(0), int104(0x69696969696969696969696969), 0);
        int104 value = bpli.unpackInt104(newWord, 0);
        assertEq(value, int104(0x69696969696969696969696969));
    }

    function testPackUnpackInt104(int104 value, uint8 bitIndex) public {
        vm.assume(bitIndex <= 152);
        (bytes32 newWord,) = bpli.packInt104(bytes32(0), value, bitIndex);
        int104 newValue = bpli.unpackInt104(newWord, bitIndex);
        assertEq(newValue, value);
    }

    function testPackInt112() public {
        (bytes32 newWord, uint256 freeBitIndex) =
            bpli.packInt112(bytes32(0), int112(0x6969696969696969696969696969), 0);

        assertEq(
            newWord,
            0x6969696969696969696969696969000000000000000000000000000000000000
        );
        assertEq(freeBitIndex, 112);
    }

    function testUnpackInt112() public {
        (bytes32 newWord,) =
            bpli.packInt112(bytes32(0), int112(0x6969696969696969696969696969), 0);
        int112 value = bpli.unpackInt112(newWord, 0);
        assertEq(value, int112(0x6969696969696969696969696969));
    }

    function testPackUnpackInt112(int112 value, uint8 bitIndex) public {
        vm.assume(bitIndex <= 144);
        (bytes32 newWord,) = bpli.packInt112(bytes32(0), value, bitIndex);
        int112 newValue = bpli.unpackInt112(newWord, bitIndex);
        assertEq(newValue, value);
    }

    function testPackInt120() public {
        (bytes32 newWord, uint256 freeBitIndex) =
            bpli.packInt120(bytes32(0), int120(0x696969696969696969696969696969), 0);

        assertEq(
            newWord,
            0x6969696969696969696969696969690000000000000000000000000000000000
        );
        assertEq(freeBitIndex, 120);
    }

    function testUnpackInt120() public {
        (bytes32 newWord,) =
            bpli.packInt120(bytes32(0), int120(0x696969696969696969696969696969), 0);
        int120 value = bpli.unpackInt120(newWord, 0);
        assertEq(value, int120(0x696969696969696969696969696969));
    }

    function testPackUnpackInt120(int120 value, uint8 bitIndex) public {
        vm.assume(bitIndex <= 136);
        (bytes32 newWord,) = bpli.packInt120(bytes32(0), value, bitIndex);
        int120 newValue = bpli.unpackInt120(newWord, bitIndex);
        assertEq(newValue, value);
    }

    function testPackInt128() public {
        (bytes32 newWord, uint256 freeBitIndex) = bpli.packInt128(
            bytes32(0), int128(0x69696969696969696969696969696969), 0
        );

        assertEq(
            newWord,
            0x6969696969696969696969696969696900000000000000000000000000000000
        );
        assertEq(freeBitIndex, 128);
    }

    function testUnpackInt128() public {
        (bytes32 newWord,) = bpli.packInt128(
            bytes32(0), int128(0x69696969696969696969696969696969), 0
        );
        int128 value = bpli.unpackInt128(newWord, 0);
        assertEq(value, int128(0x69696969696969696969696969696969));
    }

    function testPackUnpackInt128(int128 value, uint8 bitIndex) public {
        vm.assume(bitIndex <= 128);
        (bytes32 newWord,) = bpli.packInt128(bytes32(0), value, bitIndex);
        int128 newValue = bpli.unpackInt128(newWord, bitIndex);
        assertEq(newValue, value);
    }

    function testPackInt136() public {
        (bytes32 newWord, uint256 freeBitIndex) = bpli.packInt136(
            bytes32(0), int136(0x6969696969696969696969696969696969), 0
        );

        assertEq(
            newWord,
            0x6969696969696969696969696969696969000000000000000000000000000000
        );
        assertEq(freeBitIndex, 136);
    }

    function testUnpackInt136() public {
        (bytes32 newWord,) = bpli.packInt136(
            bytes32(0), int136(0x6969696969696969696969696969696969), 0
        );
        int136 value = bpli.unpackInt136(newWord, 0);
        assertEq(value, int136(0x6969696969696969696969696969696969));
    }

    function testPackUnpackInt136(int136 value, uint8 bitIndex) public {
        vm.assume(bitIndex <= 120);
        (bytes32 newWord,) = bpli.packInt136(bytes32(0), value, bitIndex);
        int136 newValue = bpli.unpackInt136(newWord, bitIndex);
        assertEq(newValue, value);
    }

    function testPackInt144() public {
        (bytes32 newWord, uint256 freeBitIndex) = bpli.packInt144(
            bytes32(0), int144(0x696969696969696969696969696969696969), 0
        );

        assertEq(
            newWord,
            0x6969696969696969696969696969696969690000000000000000000000000000
        );
        assertEq(freeBitIndex, 144);
    }

    function testUnpackInt144() public {
        (bytes32 newWord,) = bpli.packInt144(
            bytes32(0), int144(0x696969696969696969696969696969696969), 0
        );
        int144 value = bpli.unpackInt144(newWord, 0);
        assertEq(value, int144(0x696969696969696969696969696969696969));
    }

    function testPackUnpackInt144(int144 value, uint8 bitIndex) public {
        vm.assume(bitIndex <= 112);
        (bytes32 newWord,) = bpli.packInt144(bytes32(0), value, bitIndex);
        int144 newValue = bpli.unpackInt144(newWord, bitIndex);
        assertEq(newValue, value);
    }

    function testPackInt152() public {
        (bytes32 newWord, uint256 freeBitIndex) = bpli.packInt152(
            bytes32(0), int152(0x69696969696969696969696969696969696969), 0
        );

        assertEq(
            newWord,
            0x6969696969696969696969696969696969696900000000000000000000000000
        );
        assertEq(freeBitIndex, 152);
    }

    function testUnpackInt152() public {
        (bytes32 newWord,) = bpli.packInt152(
            bytes32(0), int152(0x69696969696969696969696969696969696969), 0
        );
        int152 value = bpli.unpackInt152(newWord, 0);
        assertEq(value, int152(0x69696969696969696969696969696969696969));
    }

    function testPackUnpackInt152(int152 value, uint8 bitIndex) public {
        vm.assume(bitIndex <= 104);
        (bytes32 newWord,) = bpli.packInt152(bytes32(0), value, bitIndex);
        int152 newValue = bpli.unpackInt152(newWord, bitIndex);
        assertEq(newValue, value);
    }

    function testPackInt160() public {
        (bytes32 newWord, uint256 freeBitIndex) = bpli.packInt160(
            // Compiler thinks it's an address so have to cast to uint160 before int160
            bytes32(0),
            int160(uint160(0x6969696969696969696969696969696969696969)),
            0
        );

        assertEq(
            newWord,
            0x6969696969696969696969696969696969696969000000000000000000000000
        );
        assertEq(freeBitIndex, 160);
    }

    function testUnpackInt160() public {
        (bytes32 newWord,) = bpli.packInt160(
            // Compiler thinks it's an address so have to cast to uint160 before int160
            bytes32(0),
            int160(uint160(0x6969696969696969696969696969696969696969)),
            0
        );
        int160 value = bpli.unpackInt160(newWord, 0);
        // Compiler thinks it's an address so have to cast to uint160 before int160
        assertEq(
            value, int160(uint160(0x6969696969696969696969696969696969696969))
        );
    }

    function testPackUnpackInt160(int160 value, uint8 bitIndex) public {
        vm.assume(bitIndex <= 96);
        (bytes32 newWord,) = bpli.packInt160(bytes32(0), value, bitIndex);
        int160 newValue = bpli.unpackInt160(newWord, bitIndex);
        assertEq(newValue, value);
    }

    function testPackInt168() public {
        (bytes32 newWord, uint256 freeBitIndex) = bpli.packInt168(
            bytes32(0), int168(0x696969696969696969696969696969696969696969), 0
        );

        assertEq(
            newWord,
            0x6969696969696969696969696969696969696969690000000000000000000000
        );
        assertEq(freeBitIndex, 168);
    }

    function testUnpackInt168() public {
        (bytes32 newWord,) = bpli.packInt168(
            bytes32(0), int168(0x696969696969696969696969696969696969696969), 0
        );
        int168 value = bpli.unpackInt168(newWord, 0);
        assertEq(value, int168(0x696969696969696969696969696969696969696969));
    }

    function testPackUnpackInt168(int168 value, uint8 bitIndex) public {
        vm.assume(bitIndex <= 88);
        (bytes32 newWord,) = bpli.packInt168(bytes32(0), value, bitIndex);
        int168 newValue = bpli.unpackInt168(newWord, bitIndex);
        assertEq(newValue, value);
    }

    function testPackInt176() public {
        (bytes32 newWord, uint256 freeBitIndex) = bpli.packInt176(
            bytes32(0), int176(0x69696969696969696969696969696969696969696969), 0
        );

        assertEq(
            newWord,
            0x6969696969696969696969696969696969696969696900000000000000000000
        );
        assertEq(freeBitIndex, 176);
    }

    function testUnpackInt176() public {
        (bytes32 newWord,) = bpli.packInt176(
            bytes32(0), int176(0x69696969696969696969696969696969696969696969), 0
        );
        int176 value = bpli.unpackInt176(newWord, 0);
        assertEq(value, int176(0x69696969696969696969696969696969696969696969));
    }

    function testPackUnpackInt176(int176 value, uint8 bitIndex) public {
        vm.assume(bitIndex <= 80);
        (bytes32 newWord,) = bpli.packInt176(bytes32(0), value, bitIndex);
        int176 newValue = bpli.unpackInt176(newWord, bitIndex);
        assertEq(newValue, value);
    }

    function testPackInt184() public {
        (bytes32 newWord, uint256 freeBitIndex) = bpli.packInt184(
            bytes32(0), int184(0x6969696969696969696969696969696969696969696969), 0
        );

        assertEq(
            newWord,
            0x6969696969696969696969696969696969696969696969000000000000000000
        );
        assertEq(freeBitIndex, 184);
    }

    function testUnpackInt184() public {
        (bytes32 newWord,) = bpli.packInt184(
            bytes32(0), int184(0x6969696969696969696969696969696969696969696969), 0
        );
        int184 value = bpli.unpackInt184(newWord, 0);
        assertEq(
            value, int184(0x6969696969696969696969696969696969696969696969)
        );
    }

    function testPackUnpackInt184(int184 value, uint8 bitIndex) public {
        vm.assume(bitIndex <= 72);
        (bytes32 newWord,) = bpli.packInt184(bytes32(0), value, bitIndex);
        int184 newValue = bpli.unpackInt184(newWord, bitIndex);
        assertEq(newValue, value);
    }

    function testPackInt192() public {
        (bytes32 newWord, uint256 freeBitIndex) = bpli.packInt192(
            bytes32(0),
            int192(0x696969696969696969696969696969696969696969696969),
            0
        );

        assertEq(
            newWord,
            0x6969696969696969696969696969696969696969696969690000000000000000
        );
        assertEq(freeBitIndex, 192);
    }

    function testUnpackInt192() public {
        (bytes32 newWord,) = bpli.packInt192(
            bytes32(0),
            int192(0x696969696969696969696969696969696969696969696969),
            0
        );
        int192 value = bpli.unpackInt192(newWord, 0);
        assertEq(
            value, int192(0x696969696969696969696969696969696969696969696969)
        );
    }

    function testPackUnpackInt192(int192 value, uint8 bitIndex) public {
        vm.assume(bitIndex <= 64);
        (bytes32 newWord,) = bpli.packInt192(bytes32(0), value, bitIndex);
        int192 newValue = bpli.unpackInt192(newWord, bitIndex);
        assertEq(newValue, value);
    }

    function testPackInt200() public {
        (bytes32 newWord, uint256 freeBitIndex) = bpli.packInt200(
            bytes32(0),
            int200(0x69696969696969696969696969696969696969696969696969),
            0
        );

        assertEq(
            newWord,
            0x6969696969696969696969696969696969696969696969696900000000000000
        );
        assertEq(freeBitIndex, 200);
    }

    function testUnpackInt200() public {
        (bytes32 newWord,) = bpli.packInt200(
            bytes32(0),
            int200(0x69696969696969696969696969696969696969696969696969),
            0
        );
        int200 value = bpli.unpackInt200(newWord, 0);
        assertEq(
            value, int200(0x69696969696969696969696969696969696969696969696969)
        );
    }

    function testPackUnpackInt200(int200 value, uint8 bitIndex) public {
        vm.assume(bitIndex <= 56);
        (bytes32 newWord,) = bpli.packInt200(bytes32(0), value, bitIndex);
        int200 newValue = bpli.unpackInt200(newWord, bitIndex);
        assertEq(newValue, value);
    }

    function testPackInt208() public {
        (bytes32 newWord, uint256 freeBitIndex) = bpli.packInt208(
            bytes32(0),
            int208(0x6969696969696969696969696969696969696969696969696969),
            0
        );

        assertEq(
            newWord,
            0x6969696969696969696969696969696969696969696969696969000000000000
        );
        assertEq(freeBitIndex, 208);
    }

    function testUnpackInt208() public {
        (bytes32 newWord,) = bpli.packInt208(
            bytes32(0),
            int208(0x6969696969696969696969696969696969696969696969696969),
            0
        );
        int208 value = bpli.unpackInt208(newWord, 0);
        assertEq(
            value, int208(0x6969696969696969696969696969696969696969696969696969)
        );
    }

    function testPackUnpackInt208(int208 value, uint8 bitIndex) public {
        vm.assume(bitIndex <= 48);
        (bytes32 newWord,) = bpli.packInt208(bytes32(0), value, bitIndex);
        int208 newValue = bpli.unpackInt208(newWord, bitIndex);
        assertEq(newValue, value);
    }

    function testPackInt216() public {
        (bytes32 newWord, uint256 freeBitIndex) = bpli.packInt216(
            bytes32(0),
            int216(0x696969696969696969696969696969696969696969696969696969),
            0
        );

        assertEq(
            newWord,
            0x6969696969696969696969696969696969696969696969696969690000000000
        );
        assertEq(freeBitIndex, 216);
    }

    function testUnpackInt216() public {
        (bytes32 newWord,) = bpli.packInt216(
            bytes32(0),
            int216(0x696969696969696969696969696969696969696969696969696969),
            0
        );
        int216 value = bpli.unpackInt216(newWord, 0);
        assertEq(
            value, int216(0x696969696969696969696969696969696969696969696969696969)
        );
    }

    function testPackUnpackInt216(int216 value, uint8 bitIndex) public {
        vm.assume(bitIndex <= 40);
        (bytes32 newWord,) = bpli.packInt216(bytes32(0), value, bitIndex);
        int216 newValue = bpli.unpackInt216(newWord, bitIndex);
        assertEq(newValue, value);
    }

    function testPackInt224() public {
        (bytes32 newWord, uint256 freeBitIndex) = bpli.packInt224(
            bytes32(0),
            int224(0x69696969696969696969696969696969696969696969696969696969),
            0
        );

        assertEq(
            newWord,
            0x6969696969696969696969696969696969696969696969696969696900000000
        );
        assertEq(freeBitIndex, 224);
    }

    function testUnpackInt224() public {
        (bytes32 newWord,) = bpli.packInt224(
            bytes32(0),
            int224(0x69696969696969696969696969696969696969696969696969696969),
            0
        );
        int224 value = bpli.unpackInt224(newWord, 0);
        assertEq(
            value,
            int224(0x69696969696969696969696969696969696969696969696969696969)
        );
    }

    function testPackUnpackInt224(int224 value, uint8 bitIndex) public {
        vm.assume(bitIndex <= 32);
        (bytes32 newWord,) = bpli.packInt224(bytes32(0), value, bitIndex);
        int224 newValue = bpli.unpackInt224(newWord, bitIndex);
        assertEq(newValue, value);
    }

    function testPackInt232() public {
        (bytes32 newWord, uint256 freeBitIndex) = bpli.packInt232(
            bytes32(0),
            int232(0x6969696969696969696969696969696969696969696969696969696969),
            0
        );

        assertEq(
            newWord,
            0x6969696969696969696969696969696969696969696969696969696969000000
        );
        assertEq(freeBitIndex, 232);
    }

    function testUnpackInt232() public {
        (bytes32 newWord,) = bpli.packInt232(
            bytes32(0),
            int232(0x6969696969696969696969696969696969696969696969696969696969),
            0
        );
        int232 value = bpli.unpackInt232(newWord, 0);
        assertEq(
            value,
            int232(0x6969696969696969696969696969696969696969696969696969696969)
        );
    }

    function testPackUnpackInt232(int232 value, uint8 bitIndex) public {
        vm.assume(bitIndex <= 24);
        (bytes32 newWord,) = bpli.packInt232(bytes32(0), value, bitIndex);
        int232 newValue = bpli.unpackInt232(newWord, bitIndex);
        assertEq(newValue, value);
    }

    function testPackInt240() public {
        (bytes32 newWord, uint256 freeBitIndex) = bpli.packInt240(
            bytes32(0),
            int240(0x696969696969696969696969696969696969696969696969696969696969),
            0
        );

        assertEq(
            newWord,
            0x6969696969696969696969696969696969696969696969696969696969690000
        );
        assertEq(freeBitIndex, 240);
    }

    function testUnpackInt240() public {
        (bytes32 newWord,) = bpli.packInt240(
            bytes32(0),
            int240(0x696969696969696969696969696969696969696969696969696969696969),
            0
        );
        int240 value = bpli.unpackInt240(newWord, 0);
        assertEq(
            value,
            int240(0x696969696969696969696969696969696969696969696969696969696969)
        );
    }

    function testPackUnpackInt240(int240 value, uint8 bitIndex) public {
        vm.assume(bitIndex <= 16);
        (bytes32 newWord,) = bpli.packInt240(bytes32(0), value, bitIndex);
        int240 newValue = bpli.unpackInt240(newWord, bitIndex);
        assertEq(newValue, value);
    }

    function testPackInt248() public {
        (bytes32 newWord, uint256 freeBitIndex) = bpli.packInt248(
            bytes32(0),
            int248(0x69696969696969696969696969696969696969696969696969696969696969),
            0
        );

        assertEq(
            newWord,
            0x6969696969696969696969696969696969696969696969696969696969696900
        );
        assertEq(freeBitIndex, 248);
    }

    function testUnpackInt248() public {
        (bytes32 newWord,) = bpli.packInt248(
            bytes32(0),
            int248(0x69696969696969696969696969696969696969696969696969696969696969),
            0
        );
        int248 value = bpli.unpackInt248(newWord, 0);
        assertEq(
            value,
            int248(0x69696969696969696969696969696969696969696969696969696969696969)
        );
    }

    function testPackUnpackInt248(int248 value, uint8 bitIndex) public {
        vm.assume(bitIndex <= 8);
        (bytes32 newWord,) = bpli.packInt248(bytes32(0), value, bitIndex);
        int248 newValue = bpli.unpackInt248(newWord, bitIndex);
        assertEq(newValue, value);
    }

    function testPackUnpackStuff() public {
        (bytes32 newWord1, uint256 bitIndex1) = bpli.packUint8(bytes32(0), uint8(0x23), 0);
        (bytes32 newWord2, uint256 bitIndex2) = bpli.packAddress(newWord1, address(0xBEeFbeefbEefbeEFbeEfbEEfBEeFbeEfBeEfBeef), bitIndex1);
        (bytes32 newWord3, uint256 bitIndex3) = bpli.packInt32(newWord2, int32(0x12345678), bitIndex2);
        (bytes32 newWord4,) = bpli.packUint56(newWord3, uint56(0x98765432109876), bitIndex3);
        assertEq(newWord4, bytes32(0x23BEEFBEEFBEEFBEEFBEEFBEEFBEEFBEEFBEEFBEEF1234567898765432109876));
    }
}
