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
}
