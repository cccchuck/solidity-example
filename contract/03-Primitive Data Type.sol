// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Primitives {
    // 一个字节的数组，可以表示从 0x00 ~ 0xff，也就是 0 ~ 255
    bytes1 a = 0x4c;
    // 两个字节的数组，可以表示从 0x0000 ~ 0xffff 也就是 0 ~ 65535
    bytes2 b = 0x00b5;
    // 同理以此类推
    bytes3 c = 0x0000b5;
    // 相当于 byte[]，动态字节数组
    bytes d = "asdasd43690";

    int256 public minInt = type(int256).min;
    int256 public maxInt = type(int256).max;

    function getALength() public view returns (uint8) {
        return a.length;
    }

    function getBLength() public view returns (uint8) {
        return b.length;
    }

    function getCLength() public view returns (uint8) {
        return c.length;
    }

    // bytes to string 需要使用 abi.encodePacked() 方法
    function convertBytesToString(bytes1 symbol)
        public
        pure
        returns (string memory)
    {
        string memory result = string(abi.encodePacked(symbol));
        return result;
    }

    // string to bytes 需要使用 bytes() 构造函数
    function convertStringToBytes(string memory symbol)
        public
        pure
        returns (bytes1)
    {
        bytes1 result = bytes1(bytes(symbol));
        return result;
    }

    function getDLength() public view returns (uint256) {
        return d.length;
    }
}
